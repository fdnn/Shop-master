package com.xiaohai.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadHandleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �õ��ϴ��ļ��ı���Ŀ¼
		String savePath = this.getServletContext().getRealPath("/upload");
		// �ϴ�ʱ���ɵ���ʱ�ļ�����Ŀ¼
		String tempPath = this.getServletContext().getRealPath("/temp");
		// ����ͼƬ����Ŀ�µĸ���·������/upload/1/2/xx.jpg
		String goodsPic = null;
		// �����������
		String[] goodsList = new String[10];
		File tmpFile = new File(tempPath);
		if (!tmpFile.exists()) {
			// ������ʱĿ¼
			tmpFile.mkdir();
		}

		// ��Ϣ��ʾ
		String message = "";
		try {
			// ʹ��Apache�ļ��ϴ���������ļ��ϴ����裺
			// 1������һ��DiskFileItemFactory����
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// ���ù����Ļ������Ĵ�С�����ϴ����ļ���С�����������Ĵ�Сʱ���ͻ�����һ����ʱ�ļ���ŵ�ָ������ʱĿ¼���С�
			factory.setSizeThreshold(1024 * 100);// ���û������Ĵ�СΪ100KB�������ָ������ô�������Ĵ�СĬ����10KB
			// �����ϴ�ʱ���ɵ���ʱ�ļ��ı���Ŀ¼
			factory.setRepository(tmpFile);
			// 2������һ���ļ��ϴ�������
			ServletFileUpload upload = new ServletFileUpload(factory);
			// �����ļ��ϴ�����
			upload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength, int arg2) {
					System.out.println("�ļ���СΪ��" + pContentLength + ",��ǰ�Ѵ�����" + pBytesRead);
					/**
					 * �ļ���СΪ��14608,��ǰ�Ѵ�����4096 
					 * �ļ���СΪ��14608,��ǰ�Ѵ�����7367
					 * �ļ���СΪ��14608,��ǰ�Ѵ�����11419 
					 * �ļ���СΪ��14608,��ǰ�Ѵ�����14608
					 */
				}
			});
			// ����ϴ��ļ�������������
			upload.setHeaderEncoding("UTF-8");
			// 3���ж��ύ�����������Ƿ����ϴ�����������
			if (!ServletFileUpload.isMultipartContent(request)) {
				// ���մ�ͳ��ʽ��ȡ����
				return;
			}

			// �����ϴ������ļ��Ĵ�С�����ֵ��Ŀǰ������Ϊ1024*1024�ֽڣ�Ҳ����1MB
			upload.setFileSizeMax(1024 * 1024);
			// �����ϴ��ļ����������ֵ�����ֵ=ͬʱ�ϴ��Ķ���ļ��Ĵ�С�����ֵ�ĺͣ�Ŀǰ����Ϊ10MB
			upload.setSizeMax(1024 * 1024 * 10);
			// 4��ʹ��ServletFileUpload�����������ϴ����ݣ�����������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form������������
			List<FileItem> list = upload.parseRequest(request);
			int i = 0;
			for (FileItem item : list) {
				// ���fileitem�з�װ������ͨ�����������
				if (item.isFormField()) {
					String name = item.getFieldName();
					// �����ͨ����������ݵ�������������
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
					System.out.println(name + "=" + value);
					goodsList[i] = value;
					i++;
				} else {// ���fileitem�з�װ�����ϴ��ļ�
					// �õ��ϴ����ļ����ƣ�
					String filename = item.getName();
					System.out.println(filename);
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					// ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺
					// c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
					// ������ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
					filename = filename.substring(filename.lastIndexOf("\\") + 1);
					// �õ��ϴ��ļ�����չ��
					String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
					// �����Ҫ�����ϴ����ļ����ͣ���ô����ͨ���ļ�����չ�����ж��ϴ����ļ������Ƿ�Ϸ�
					System.out.println("�ϴ����ļ�����չ���ǣ�" + fileExtName);
					// ��ȡitem�е��ϴ��ļ���������
					InputStream in = item.getInputStream();
					// �õ��ļ����������
					String saveFilename = makeFileName(filename);
					// �õ��ļ��ı���Ŀ¼
					String realSavePath = makePath(saveFilename, savePath);
					// ����һ���ļ������
					FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
					//System.out.println(savePath);
					//System.out.println(realSavePath);
					//System.out.println(saveFilename);
					goodsPic = realSavePath + "\\" + saveFilename;
					// ����һ��������
					byte buffer[] = new byte[1024];
					// �ж��������е������Ƿ��Ѿ�����ı�ʶ 
					int len = 0;
					// ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
					while ((len = in.read(buffer)) > 0) {
						// ʹ��FileOutputStream�������������������д�뵽ָ����Ŀ¼(savePath + "\\"
						// + filename)����
						out.write(buffer, 0, len);
					}
					// �ر�������
					in.close();
					// �ر������
					out.close(); 
					// ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ� 
					item.delete(); 
					message = "�ļ��ϴ��ɹ���";
				}
			}
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "�����ļ��������ֵ������");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "�ϴ��ļ����ܵĴ�С�������Ƶ����ֵ������");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			message = "�ļ��ϴ�ʧ�ܣ�";
			e.printStackTrace();
		}
		
		String refer = request.getHeader("referer"); 
		String url = null;
		//System.out.println(refer.substring(refer.lastIndexOf(".action")-1));
		if(refer.substring(refer.lastIndexOf(".action")-1).equals("t.action")){
			goodsPic = goodsPic.substring(goodsPic.lastIndexOf("upload") - 1);
			goodsPic = goodsPic.replace("\\", "/");
			url="/goodsAdd.action?"+
				"goodsCatelogId="+goodsList[0]+
				"&&goodsName="+goodsList[1]+
				"&&goodsMiaoshu="+goodsList[2]+
				"&&goodsPic="+goodsPic+
				"&&goodsTuijian="+goodsList[3]+
				"&&goodsShichangjia="+goodsList[4]+
				"&&goodsTejia="+goodsList[5]+
				"&&goodsKucun="+goodsList[6];
		}else{
			if(goodsPic==null)
			{	
				url="/goodsUpdate.action?"+
					"goodsId="+goodsList[0]+
					"&&goodsCatelogId="+goodsList[1]+
					"&&goodsName="+goodsList[2]+
					"&&goodsMiaoshu="+goodsList[3]+
					"&&goodsPic="+goodsList[4]+
					"&&goodsTuijian="+goodsList[5]+
					"&&goodsShichangjia="+goodsList[6]+
					"&&goodsTejia="+goodsList[7]+
					"&&goodsKucun="+goodsList[8];
			}else{
				goodsPic = goodsPic.substring(goodsPic.lastIndexOf("upload") - 1);
				goodsPic = goodsPic.replace("\\", "/");
				url="/goodsUpdate.action?"+
					"goodsId="+goodsList[0]+
					"&&goodsCatelogId="+goodsList[1]+
					"&&goodsName="+goodsList[2]+
					"&&goodsMiaoshu="+goodsList[3]+
					"&&goodsPic="+goodsPic+
					"&&goodsTuijian="+goodsList[5]+
					"&&goodsShichangjia="+goodsList[6]+
					"&&goodsTejia="+goodsList[7]+
					"&&goodsKucun="+goodsList[8];
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @Method: makeFileName
	 * @Description: �����ϴ��ļ����ļ������ļ����ԣ�uuid+"_"+�ļ���ԭʼ����
	 * @param filename �ļ���ԭʼ����
	 * @return uuid+"_"+�ļ���ԭʼ����
	 */
	private String makeFileName(String filename) { 
		// 2.jpg
		// Ϊ��ֹ�ļ����ǵ���������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * @Method: makePath
	 * @Description:Ϊ��ֹһ��Ŀ¼�������̫���ļ���Ҫʹ��hash�㷨��ɢ�洢
	 * @param filename �ļ�����Ҫ�����ļ������ɴ洢Ŀ¼
	 * @param savePath �ļ��洢·��
	 * @return �µĴ洢Ŀ¼
	 */
	private String makePath(String filename, String savePath) {
		// �õ��ļ�����hashCode��ֵ���õ��ľ���filename����ַ����������ڴ��еĵ�ַ
		int hashcode = filename.hashCode();
		int dir1 = hashcode & 0xf; // 0--15
		int dir2 = (hashcode & 0xf0) >> 4; // 0-15
		// �����µı���Ŀ¼
		String dir = savePath + "\\" + dir1 + "\\" + dir2; // upload\2\3
															// upload\3\5
		// File�ȿ��Դ����ļ�Ҳ���Դ���Ŀ¼ 
		File file = new File(dir);
		// ���Ŀ¼������
		if (!file.exists()) {
			// ����Ŀ¼
			file.mkdirs();
		}
		return dir;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}