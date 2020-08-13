package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.UtilFile;
import com.project.dto.DataListDTO;
import com.project.dto.MyimgDTO;
import com.project.service.AdminService;
import com.project.service.MyimgService;
import com.project.service.makePngFileService;

@Controller
public class UploadController {
	@Autowired
	private makePngFileService service;
	@Autowired
	private MyimgService myimgservice;
	@Autowired
	private AdminService adminservice;

	@RequestMapping(value="makeFile",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String makeFile(@RequestParam String imgbase64){
		//    	System.out.println("imgbase64 : "+imgbase64);
		return service.makePngFile(imgbase64);
	}


	@Resource(name="uploadPath")
	private String uploadPath; //업로드된 파일 저장 경로

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@RequestMapping(value="fileUpload", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String upload(MultipartFile file,Model model,HttpServletRequest request)throws Exception{
		//저장된 파일 이름
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		MyimgDTO dto = new MyimgDTO();
		dto.setImg("'"+savedName+"'");
		HttpSession session = request.getSession();
		dto.setId(session.getAttribute("id").toString());
		myimgservice.insert(dto);
		return savedName;
	}

	private String uploadFile(String originName, byte[] fileData)throws Exception{

		//현재 날짜 시간 데이터 만들기
		Date today = new Date ();
		SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");

		//현재 날짜 시간 데이터에 오리진 이름 합쳐서 파일명을 설정
		String savedName = fomat.format(today) + "_"+originName;

		logger.info("savedName : "+savedName);

		//저장할 파일 객체 생성
		File target = new File(uploadPath,savedName);

		//파일을 복사(데이터, 경로)
		FileCopyUtils.copy(fileData, target);

		return savedName;
	}


	@Resource(name="uploadProductImg")
	private String uploadProductImg;

	@RequestMapping(value = "AddProduct", method = RequestMethod.POST)
	public String reAddProCtrl(MultipartHttpServletRequest request,
			@RequestParam("product") String product,@RequestParam("type") String type,@RequestParam("price") String price,
			@RequestParam("quantity") String quantity) {

		System.out.println(product);
		System.out.println(type);
		MultipartFile defaultFile = request.getFile("File");
		MultipartFile singleDesignFile = request.getFile("SingleDesignFile");
		System.out.println(singleDesignFile);
		List<MultipartFile> List = request.getFiles("DesignFile");
		System.out.println(List);
		int i=1;
		if(defaultFile !=null) {
			System.out.println("기본피팅 업로드시작");
			String Filetype = defaultFile.getOriginalFilename().substring(defaultFile.getOriginalFilename().lastIndexOf(".")+1);
			//String orginFileName = mf.getOriginalFilename();
			String orgFileName = product + "."+"png";
			String path = "C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\img\\" 
					+ type + "\\" + orgFileName;
			try {
				defaultFile.transferTo(new File(path));
				DataListDTO dto = new DataListDTO();
				String[] arr = path.split("\\\\webapp\\\\");
				String str1 = arr[1].replaceAll("\\\\", "/");
				System.out.println(str1);
				String[] arr2 = type.split(" ");
				String str2 = arr2[0].replaceAll("\\\\", "/");
				System.out.println(str2);

				dto.setImg(str1);dto.setProduct(product);dto.setType(str2);
				dto.setPrice(Integer.parseInt(price));dto.setQuantity(Integer.parseInt(quantity));

				adminservice.AddProduct(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		if(type.equals("earring pitting")) {
			System.out.println("다중 업로드 귀걸이꺼if문시작");
			for(MultipartFile mf : List) {
				String Filetype = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".")+1);
				//String orginFileName = mf.getOriginalFilename();
				String orgFileName = product +i+ "."+"png";
				String retype=type.replace("pitting", "design");
				String path = "C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\img\\" 
						+ retype + "\\" + orgFileName;

				try {
					mf.transferTo(new File(path));
					DataListDTO dto = new DataListDTO();
					String[] arr = path.split("\\\\webapp\\\\");
					String str1 = arr[1].replaceAll("\\\\", "/");
					System.out.println(str1);
					String[] arr2 = type.split(" ");
					String str2 = arr2[0].replaceAll("\\\\", "/");
					System.out.println(str2);

					dto.setImg(str1);dto.setProduct(product);dto.setType(str2);
					dto.setPrice(Integer.parseInt(price));dto.setQuantity(Integer.parseInt(quantity));

					adminservice.AddProduct(dto);
					i++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}else if(singleDesignFile !=null) {
			System.out.println("디자인싱글업로드시작");
			String Filetype = singleDesignFile.getOriginalFilename().substring(singleDesignFile.getOriginalFilename().lastIndexOf(".")+1);
			//String orginFileName = mf.getOriginalFilename();
			String orgFileName = product + "."+"png";
			String retype=type.replace("pitting", "design");
			String path = "C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\img\\" 
					+ retype + "\\" + orgFileName;
			try {
				singleDesignFile.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return "admin/QuantityManage";
	}



}
