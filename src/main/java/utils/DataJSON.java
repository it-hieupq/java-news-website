package utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class DataJSON {
	
	public static String getJSONData(String api, String method) throws IOException {
		URL url;
		try {
			url = new URL(api);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod(method);
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			return response.toString();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void setJSONData(String api, String method) {
		URL url;
		try {
			String json = "{\"title\": \"Đại dịch ở WHOOOOOO\",\"description\": \"Phía sau câu chuyện chống Covid-19 tại WHO\",\"content\": \"Các ghi âm được tiết lộ cho thấy Tổ chức Y tế Thế giới (WHO) đã chậm trễ trong việc xử lý đại dịch, coi nhiều nước là 'phòng thí nghiệm bất đắc dĩ nghiên cứu virus'.Bản ghi âm được hãng tin Associated Press (AP) thu thập từ tháng 1 đến tháng 4, công bố ngày 11/11. Theo đó, các chuyên gia WHO cố ý chờ đợi xem cách chống dịch của nước nào hiệu quả. Tuy nhiên, trước công chúng, WHO vẫn ca ngợi các chính phủ vì phản ứng với đại dịch.Theo AP, chuỗi phản ứng dè dặt của WHO bắt đầu với Trung Quốc. Tổng giám đốc Tedros Adhanom và Chủ tịch Trung Quốc Tập Cận Bình đã có cuộc gặp hồi tháng 1, nhưng thông tin về đợt bùng phát vẫn ít ỏi cho tới tháng 2.Ngày 1/2, một hành khách trên chiếc du thuyền hạng sang Diamond Princess xét nghiệm dương tính với nCoV. Tại điểm dừng ở Yokohama, 10 người khác được xác nhận mắc Covid-19. Giới chức Nhật Bản lập tức phong tỏa con tàu cùng 3.711 hành khách.Thời điểm đó, Micheal Ryan, Giám đốc Chương trình Khẩn cấp của WHO, cho biết: 'Chúng ta cần cẩn thận để không phản ứng thái quá'. Song đến ngày 10/2, số ca nhiễm trên tàu tăng gấp đôi chỉ sau một đêm.Tiến sĩ Thomas Grein, Trưởng Nhóm Quản lý Các biến cố cấp tính của WHO, báo cáo rằng tổ chức đã thảo luận về cụm dịch này, nhưng không thu được nhiều thông tin hữu ích.Dù tình hình xấu đi, các nhà khoa học cho rằng trường hợp tàu Diamond Princess có thể giúp tìm hiểu mô hình lây truyền của Covid-19. 'Thật không may, nhưng đây là cơ hội hữu ích để nghiên cứu nguồn gốc tự nhiên của virus', Ryan nói.Vài ngày sau, chuyên gia về dịch bệnh Nhật Bản, tiến sĩ Kentaro Iwata, đã lên tàu. Theo ông, tình hình tại đây 'hoàn toàn hỗn loạn'. Ngay sau đó, WHO thông báo hơn một nửa số ca nhiễm ngoài Trung Quốc là hành khách và thuyền viên trên tàu Diamond Princess.Lawrence Gostin, Giám đốc Trung tâm Hợp tác của WHO về Luật Y tế Công cộng và Nhân quyền, Đại học Georgetown, cho biết: 'Rõ ràng trên con tàu du lịch đó, mọi thứ đang diễn biến rất tồi tệ và WHO nên tuyên bố gì đó. Khi các quốc gia đi sai hướng, WHO cần thông báo điều này'.Suốt tháng 2 và tháng 3, Covid-19 đã bùng phát ở Hàn Quốc, Singapore, Iran và nhiều nơi khác. Virus cũng lây lan sang Italy, biến châu Âu thành tâm dịch.Trong đoạn ghi âm cuộc họp nội bộ, các quan chức WHO lo lắng về việc thiếu thông tin từ các nước thành viên EU. Tiến sĩ Thomas Gein thừa nhận WHO đã 'thất bại đau đớn' trong nỗ lực tìm hiểu chi tiết hơn về các đợt bùng phát. Ngày 26/2, Tổng Giám đốc WHO Tedros Adhanom, cho biết: 'Một trong những thách thức lớn nhất mà chúng tôi phải đối mặt là nhiều quốc gia vẫn chưa chia sẻ dữ liệu'.Tuy nhiên, ngày 8/3, trên Twitter cá nhân, Tedros viết: 'Chính phủ và người dân Italy đang thực hiện những bước đi táo bạo, can đảm nhằm làm chậm sự lây lan của virus để bảo vệ đất nước'.Ba ngày sau, ông tuyên bố Covid-19 là đại dịch, phần vì một số nước đã 'không hành động kịp thời'.Tiến sĩ Lawrence Gostin nhấn mạnh đáng lẽ WHO phải có nghĩa vụ báo cáo công khai danh sách quốc gia không chia sẻ dữ liệu. 'Nếu một nước không cung cấp đủ thông tin dịch tễ hoặc sinh học quan trọng, WHO và cả thế giới sẽ mờ mịt trong đợt bùng phát', ông nói.Tại các cuộc họp kín, WHO cũng phàn nàn về việc các nước phương Tây tích trữ nguồn cung vật tư y tế khan hiếm. Ông Ryan nói với các đồng nghiệp: 'Chúng ta đã gặp phải tình huống khủng khiếp đối với thiết bị bảo hộ cá nhân. Vật tư dồn về Pháp và chúng tôi mất quyền tiếp cận'. Ông nhận định WHO cần gây áp lực với các quốc gia để tránh những tình huống tương tự.Khi hàng loạt nước châu Âu thực hiện giãn cách xã hội hồi tháng 3, WHO nhận thức Anh không có hành động tương tự, khi các trận Premier League vẫn diễn ra bình thường. Sau khi Anh tuyên bố quốc gia đang hướng tới phương án 'miễn dịch cộng đồng', tiến sĩ Ryan cho rằng chiến lược chống dịch này 'có vấn đề'.'Hàng trăm nghìn, hàng triệu người cao tuổi sẽ nhiễm bệnh và sẽ có rất nhiều ca tử vong', ông nói. Tuy nhiên, WHO coi đây là 'nghiên cứu sinh thái lớn', cho phép ghi lại những phương pháp hiệu quả nhất để giải quyết đại dịch.'Nó rùng rợn, nhưng thực tế', ông Ryan nói.Một trong những hạn chế của WHO là không có thẩm quyền điều tra độc lập từng quốc gia. Thay vào đó, cơ quan y tế dựa vào các cuộc đàm phán hậu trường và sự hợp tác của các nước thành viên.Khi Covid-19 lan rộng, WHO thường né tránh kêu gọi hay lên án phản ứng của các nước, dù những nhà tài trợ ngân sách chính như Nhật Bản, Pháp và Anh đã liên tục mắc sai lầm.Một số chuyên gia y tế công cộng cho rằng việc WHO không phát huy được tầm ảnh hưởng đã vô tình khiến các quốc gia áp dụng chính sách khiến dịch bệnh bùng phát nghiêm trọng hơn, ảnh hưởng nỗ lực chung đẩy lùi virus.Giáo sư Sophie Harman, khoa chính trị quốc tế, Đại học Queen Mary ở London, nhận định WHO đang đánh mất quyền lực của chính mình khi không lên tiếng về những hành động đáng nghi vấn ở các nước thành viên.Nhiều chuyên gia khác cho rằng sẽ không khôn ngoan về mặt chính trị nếu WHO quá thẳng thắn lên tiếng chỉ trích. Đức và Pháp gần đây đã đề xuất trao quyền lực nhiều hơn cho cơ quan này.Tuy nhiên, việc WHO công khai chất vấn các quốc gia thành viên không phải chưa có tiền lệ. Trong dịch SARS năm 2003, cơ quan đã đe dọa sẽ đóng cửa văn phòng ở Trung Quốc khi nghi ngờ nước này che dấu các ca nhiễm. Tổ chức cũng từng kêu gọi Nigeria giải quyết vấn đề tẩy chay vaccine bại liệt và cáo buộc Tanzania không chia sẻ đầy đủ thông tin về dịch Ebola năm ngoái.Việc đánh giá vai trò của WHO với đại dịch lúc này rất quan trọng, bởi cơ quan đang được giao nhiệm vụ giúp mua bán và phân phối vaccine Covid-19 trên toàn thế giới. Một số nước như Mỹ và Nga đã từ chối tham gia chương trình này.\",\"thumnail\": \"https://i1-suckhoe.vnecdn.net/2020/11/14/1000-15-jpeg-1605328946-1440-1605329145.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=SYOBRh12rnpECUc0ryQoEA\",\"slug\": \"http://localhost:8080/ptinews/suc-khoe/covid-va-who\"}";
			url = new URL(api);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
            wr.writeBytes(json);
            wr.flush();
            wr.close();
		} catch (Exception e) {
		}
	}
}
