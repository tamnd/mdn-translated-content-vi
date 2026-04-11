---
title: WebVR concepts
slug: Web/API/WebVR_API/Concepts
page-type: guide
---

{{DefaultAPISidebar("WebVR API")}}

> [!NOTE]
> WebVR API được thay thế bởi [WebXR API](/en-US/docs/Web/API/WebXR_Device_API). WebVR chưa bao giờ được phê chuẩn thành một tiêu chuẩn, chỉ được triển khai và bật mặc định trong rất ít trình duyệt, và chỉ hỗ trợ một số ít thiết bị.

Bài viết này thảo luận một số khái niệm và lý thuyết đằng sau thực tế ảo (VR). Nếu bạn là người mới với lĩnh vực này, việc hiểu những chủ đề này trước khi bắt đầu đi vào mã là rất đáng giá.

## Lịch sử của VR

Thực tế ảo không có gì mới - khái niệm này đã xuất hiện từ rất lâu trước chiến dịch Kickstarter của Oculus Rift vào năm 2012. Con người đã thử nghiệm nó trong nhiều thập kỷ.

Năm 1939, [thiết bị View-Master](https://en.wikipedia.org/wiki/View-Master) được tạo ra, cho phép mọi người xem ảnh 3D. Thiết bị này hiển thị các hình ảnh được lưu trên đĩa bìa cứng chứa các cặp ảnh stereoscopic 3D nhỏ. Sau nhiều năm phát triển, quân đội bắt đầu quan tâm đến việc dùng công nghệ này, và Project Headsight ra đời vào năm 1961 - dự án này bao gồm một chiếc mũ có màn hình video và hệ thống theo dõi đầu.

Trong vài thập kỷ tiếp theo có nhiều thử nghiệm khác nhau, nhưng nó không còn bị giới hạn trong phòng thí nghiệm hay chiến trường nữa. Cuối cùng, văn hóa đại chúng đã tiếp quản với các đạo diễn phim thể hiện tầm nhìn của họ về thực tế ảo. Những bộ phim như Tron (1982) và The Matrix (1999) ra đời, nơi con người có thể chuyển mình sang một thế giới mạng hoàn toàn mới hoặc bị mắc kẹt trong đó mà không hề hay biết, chấp nhận nó như thế giới thật.

Những nỗ lực game VR đầu tiên thì lớn và đắt đỏ - năm 1991, Virtuality Group tạo ra một máy arcade sẵn sàng cho VR với kính bảo hộ và port các tựa phổ biến như Pac-Man sang thực tế ảo. Sega giới thiệu kính VR của họ tại Consumer Electronics Show năm 1993. Các công ty đã thử nghiệm, nhưng thị trường và người tiêu dùng chưa bị thuyết phục - phải tới năm 2012 chúng ta mới thấy một ví dụ thực sự của một dự án VR thành công.

### VR trong thời gian gần đây

Vậy có gì mới? Phần cứng Thực tế ảo cần cung cấp dữ liệu chính xác cao, độ trễ thấp để đem lại trải nghiệm người dùng chấp nhận được; các máy tính chạy ứng dụng VR cần đủ mạnh để xử lý tất cả thông tin đó. Phải đến gần đây mới có độ chính xác và sức mạnh như vậy với chi phí chấp nhận được, nếu có. Các nguyên mẫu VR sớm có giá hàng chục nghìn đô la, trong khi các headset gần đây hơn như [HTC VIVE](https://www.vive.com/uk/) và [Meta Quest](https://www.meta.com/quest/quest-3/) có giá hàng trăm đô la, và cũng có các giải pháp rẻ hơn - các giải pháp dựa trên thiết bị di động như [Google Cardboard](https://arvr.google.com/cardboard/).

Về mặt phần mềm, Valve đã tạo ra phần mềm [SteamVR](https://store.steampowered.com/search/?category1=993), tương thích với VIVE và các giải pháp khác, và phục vụ để cung cấp quyền truy cập vào phần mềm, chẳng hạn như một giao diện VR có thể sử dụng được.

Bản thân công nghệ đã ở đây, và các headset đắt hơn sẽ chỉ ngày càng rẻ theo thời gian để nhiều người hơn có thể tự trải nghiệm thực tế ảo trong tương lai.

### Thiết bị nhập liệu

Xử lý đầu vào cho các ứng dụng thực tế ảo là một chủ đề thú vị - đây là một trải nghiệm hoàn toàn mới, đòi hỏi phải thiết kế giao diện người dùng chuyên dụng. Hiện có nhiều cách tiếp cận, từ bàn phím và chuột cổ điển, tới những cách mới như Leap Motion và các bộ điều khiển VIVE. Đó là vấn đề thử và sai để xem cái gì hiệu quả trong từng tình huống và đầu vào nào phù hợp nhất cho loại game của bạn.

## Thiết lập phần cứng VR

Có hai loại thiết lập chính, di động hoặc kết nối với máy tính. Các thiết lập phần cứng tối thiểu như sau:

- Di động: Một màn hình gắn đầu (HMD) được tạo bằng điện thoại thông minh - đóng vai trò là màn hình VR - được gắn trong một giá đỡ VR như Google Cardboard, có chứa các thấu kính cần thiết để cung cấp thị giác lập thể về thứ được chiếu trên màn hình di động.![Mobile based VR setup](mobilebasedvrsetup.png)
- Kết nối với máy tính: Một thiết lập VR được nối với máy tính của bạn - nó bao gồm một Head Mounted Display (HMD) có màn hình độ phân giải cao theo chiều ngang, trên đó hình ảnh cho cả mắt trái và mắt phải được hiển thị, đồng thời cũng bao gồm một thấu kính cho mỗi mắt để tăng sự tách biệt của cảnh hai mắt (stereoscopic vision.) Thiết lập này cũng bao gồm một cảm biến vị trí riêng để xác định vị trí/orientation/vận tốc/gia tốc của đầu bạn và liên tục truyền thông tin đó tới máy tính. ![Computer based VR Setup](computerbasedvrsetup.png)

> [!NOTE]
> Các hệ thống kết nối với máy tính đôi khi không bao gồm cảm biến vị trí, nhưng thường thì có.

Phần cứng khác bổ sung cho trải nghiệm VR bao gồm:

- **Cảm biến nhận diện bàn tay**: Một cảm biến theo dõi vị trí và chuyển động của bàn tay bạn, cho phép nó trở thành một bộ điều khiển thú vị và một đối tượng trong thế giới game VR. Tiên tiến nhất cho tới nay là [Leap Motion](https://www.ultraleap.com/), hoạt động với máy tính (kết nối với Oculus Rift) và cũng có thể hoạt động khi kết nối với thiết bị di động (cái sau vẫn đang ở giai đoạn thử nghiệm.)
- **Gamepad**: Chúng ta có thể cấu hình một tay cầm XBox hoặc tương tự để hoạt động như bàn phím trong trình duyệt - điều này mở ra thêm các khả năng tương tác với trang web VR. Có một số gamepad hoạt động với thiết lập di động nhưng chúng kết nối qua Bluetooth nên không hoạt động với WebVR.
- **Cảm biến theo dõi mắt (thử nghiệm)**: Dự án FOVE là headset đầu tiên đọc được những chuyển động tinh tế của mắt.
- **Bộ theo dõi biểu cảm khuôn mặt (thử nghiệm)**: Các nhà nghiên cứu tại Đại học Nam California và bộ phận Oculus của Facebook đã thử nghiệm những cách mới để theo dõi biểu cảm khuôn mặt và chuyển chúng sang một nhân vật ảo.
- **Một hệ thống cảm biến vị trí phức tạp hơn**: Ví dụ, HTC VIVE có hai cảm biến vị trí đặt ở hai góc đối diện của một không gian, ánh xạ toàn bộ khu vực và cho phép trải nghiệm VR trong không gian lên tới 5m x 5m.

## Vị trí và hướng, vận tốc và gia tốc

Như đã đề cập ở trên, cảm biến vị trí phát hiện thông tin liên quan đến HMD và liên tục xuất ra nó, cho phép bạn liên tục cập nhật cảnh theo chuyển động đầu, xoay, v.v. Nhưng thông tin đó cụ thể là gì?

![Position and Orientation VR setup](positionorientationvr.png)

Thông tin đầu ra thuộc bốn nhóm:

1. Vị trí - Vị trí của HMD theo ba trục trong không gian tọa độ 3D. x là trái và phải, y là lên và xuống, còn z là hướng về và ra xa cảm biến vị trí. Trong WebVR, các tọa độ x, y và z được biểu diễn bởi mảng chứa trong {{domxref("VRPose.position")}}.
2. Hướng - Sự quay của HMD quanh ba trục trong không gian tọa độ 3D. Pitch là quay quanh trục x, yaw là quay quanh trục y, và roll là quay quanh trục z. Trong WebVR, pitch, yaw và roll được biểu diễn bởi ba phần tử đầu tiên của mảng chứa trong {{domxref("VRPose.orientation")}}.
3. Vận tốc - Có hai loại vận tốc cần xét trong VR:
   - Tuyến tính - Tốc độ dọc theo bất kỳ trục nào mà HMD đang di chuyển. Thông tin này có thể truy cập bằng {{domxref("VRPose.linearVelocity")}}.
   - Góc - Tốc độ mà HMD đang quay quanh bất kỳ trục nào. Thông tin này có thể truy cập bằng {{domxref("VRPose.angularVelocity")}}.

4. Gia tốc - Có hai loại gia tốc cần xét trong VR:
   - Tuyến tính - Gia tốc chuyển động dọc theo bất kỳ trục nào mà HMD đang di chuyển. Thông tin này có thể truy cập bằng {{domxref("VRPose.linearAcceleration")}}.
   - Góc - Gia tốc quay của HMD quanh bất kỳ trục nào. Thông tin này có thể truy cập bằng {{domxref("VRPose.angularAcceleration")}}.

## Trường nhìn

Trường nhìn (FOV) là vùng mà mỗi mắt của người dùng có thể nhìn thấy một cách hợp lý. Nó gần giống hình kim tự tháp đặt nghiêng sang một bên, với đỉnh nằm bên trong đầu người dùng, và phần còn lại của kim tự tháp lan tỏa từ mắt người dùng. Mỗi mắt có FOV riêng, chồng lấn nhẹ lên mắt kia.

![FOV related properties](fovrelatedproperties.png)

FOV được xác định bởi các giá trị sau:

- {{domxref("VRFieldOfView.upDegrees")}}: Số độ mà trường nhìn mở rộng lên trên.
- {{domxref("VRFieldOfView.rightDegrees")}}: Số độ mà trường nhìn mở rộng sang phải.
- {{domxref("VRFieldOfView.downDegrees")}}: Số độ mà trường nhìn mở rộng xuống dưới.
- {{domxref("VRFieldOfView.leftDegrees")}}: Số độ mà trường nhìn mở rộng sang trái.
- zNear, được định nghĩa bởi {{domxref("VRDisplay.depthNear")}}: Khoảng cách từ giữa đầu người dùng tới điểm bắt đầu của FOV có thể nhìn thấy.
- zFar, được định nghĩa bởi {{domxref("VRDisplay.depthFar")}}: Khoảng cách từ giữa đầu người dùng tới điểm kết thúc của FOV có thể nhìn thấy.

Các giá trị mặc định cho các thuộc tính này sẽ khác nhau đôi chút tùy phần cứng VR, mặc dù chúng thường vào khoảng 53° lên và xuống, và 47° trái và phải, với zNear và zFar lần lượt vào khoảng 0.1m và 10000m.

> [!NOTE]
> Người dùng có khả năng nhìn thấy xung quanh mình, điều này là một khái niệm hoàn toàn mới cho ứng dụng và game. Hãy cố gắng cho người dùng một lý do để nhìn xung quanh và xem phía sau họ - khiến họ với tay ra và tìm những thứ không nhìn thấy ngay từ đầu. Hãy mô tả những gì ở sau lưng họ.

## Khái niệm cho ứng dụng VR

Phần này thảo luận các khái niệm bạn cần lưu ý khi phát triển ứng dụng VR, những thứ có lẽ bạn chưa từng phải cân nhắc khi phát triển ứng dụng thường cho di động hay máy tính để bàn.

### Thị giác lập thể

Thị giác lập thể là thị giác bình thường của con người và (phần lớn) động vật - việc cảm nhận hai hình ảnh hơi khác nhau (mỗi mắt một hình) như một hình duy nhất. Điều này tạo ra cảm nhận chiều sâu, giúp chúng ta nhìn thế giới trong 3D rực rỡ. Để tái tạo điều này trong ứng dụng VR, bạn cần render hai góc nhìn hơi khác nhau đặt cạnh nhau, thứ sẽ được mắt trái và mắt phải tiếp nhận khi người dùng dùng HMD.

![How to create stereoscopic 3D images](createstereoscopicimages.png)

### Theo dõi đầu

Công nghệ chính được dùng để khiến bạn cảm thấy đang hiện diện trong một cảnh 360º, nhờ con quay hồi chuyển, gia tốc kế và từ kế (la bàn) tích hợp trong HMD.
Điều này có tầm quan trọng hàng đầu vì nó khiến mắt chúng ta tin rằng mình đang ở trước một màn hình hình cầu, mang lại cho người dùng cảm giác nhập vai thực tế bên trong canvas của ứng dụng.

### Mỏi mắt

Đây là một thuật ngữ thường dùng trong VR vì đó là một hạn chế lớn của việc dùng HMD - chúng ta liên tục đánh lừa mắt bằng những gì hiển thị trên canvas ứng dụng, và điều này khiến mắt phải làm việc nhiều hơn bình thường, nên việc dùng ứng dụng VR trong thời gian dài có thể dẫn đến mỏi mắt.

Để giảm thiểu tác động không mong muốn này, chúng ta cần:

- Tránh tập trung vào các độ sâu khác nhau (ví dụ, tránh dùng nhiều hạt có độ sâu khác nhau.)
- Tránh hội tụ mắt (ví dụ, nếu bạn có một vật tiến về phía camera, mắt bạn sẽ theo và hội tụ vào nó.)
- Dùng nền tối với màu sắc dịu hơn khi có thể; màn hình sáng sẽ làm mắt mệt hơn.
- Tránh thay đổi độ sáng đột ngột.
- Tránh đưa cho người dùng quá nhiều văn bản để đọc. Bạn cũng nên cẩn thận với khoảng cách giữa mắt/camera và đoạn văn bản cần đọc. 0.5m là không thoải mái, trong khi trên 2m hiệu ứng lập thể bắt đầu suy yếu, nên khoảng giữa là hợp lý.
- Cẩn thận với khoảng cách giữa vật thể và camera nói chung. Oculus khuyến nghị khoảng cách lấy nét tối thiểu là 0.75m.
- Dùng một con trỏ nếu người dùng cần tương tác với một vật thể trong cảnh - điều này sẽ giúp họ chỉ vào nó đúng hơn với ít nỗ lực hơn.

Nói chung, con đường ít tốn công thị giác nhất sẽ đem lại trải nghiệm ít mệt mỏi hơn cho người dùng.

### Say chuyển động

Nếu nhà phát triển không cực kỳ cẩn thận, ứng dụng VR thực sự có thể khiến người dùng cảm thấy buồn nôn. Hiệu ứng này xảy ra khi các kích thích mà mắt nhận được không giống thứ mà cơ thể mong đợi nhận được.

Để tránh gây say chuyển động cho người dùng (hoặc ít nhất giảm thiểu tác động), chúng ta cần:

- Luôn duy trì theo dõi đầu (đây là điều quan trọng nhất, đặc biệt nếu nó xảy ra giữa trải nghiệm.)
- Dùng vận tốc không đổi; tránh các chuyển động camera tăng tốc hoặc giảm tốc (dùng gia tốc tuyến tính, và tránh easing nếu có thể.)
- Giữ tốc độ khung hình cao (thấp hơn 30fps là không thoải mái.)
- Tránh các chuyển động quay camera mạnh và/hoặc bất ngờ.
- Thêm các điểm tham chiếu cố định cho các vật thể cố định (nếu không người dùng sẽ nghĩ rằng họ đang di chuyển.)
- Không dùng hậu xử lý Depth of Field hoặc Motion Blur vì bạn không biết mắt sẽ tập trung ở đâu.
- Tránh thay đổi độ sáng (dùng texture tần số thấp hoặc hiệu ứng sương mù để tạo các chuyển đổi ánh sáng mượt mà).

Nhìn chung, mắt bạn không nên gửi tín hiệu tới não gây ra các phản xạ ở những phần khác của cơ thể.

### Độ trễ

Độ trễ là thời gian giữa chuyển động vật lý của đầu và lúc màn hình HMD cập nhật hiển thị tới mắt người dùng. Đây là một trong những yếu tố quan trọng nhất để tạo ra trải nghiệm chân thực. Con người có thể nhận ra những độ trễ rất nhỏ - chúng ta cần giữ độ trễ dưới 20 mili giây để chúng không thể cảm nhận được (ví dụ, một màn hình 60Hz có thời gian phản hồi 16 ms.)

Headset Oculus Rift có độ trễ 20 ms hoặc thấp hơn, nhưng với các thiết lập dựa trên thiết bị di động thì nó sẽ phụ thuộc nhiều vào sức mạnh CPU của điện thoại thông minh và các khả năng khác.

### Tốc độ khung hình (Frames per second / FPS)

Dựa trên định nghĩa của Wikipedia, tốc độ khung hình là tần suất mà một thiết bị hình ảnh tạo ra các hình ảnh liên tiếp duy nhất, gọi là frames. Tốc độ 60fps là chấp nhận được cho trải nghiệm người dùng mượt mà, nhưng tùy theo hiệu năng của máy đang chạy ứng dụng, hoặc độ phức tạp của nội dung bạn muốn hiển thị, nó có thể giảm đáng kể. Dưới 30fps thường bị coi là giật và gây khó chịu cho người dùng.

Một trong những nhiệm vụ khó nhất là duy trì tốc độ khung hình cao và ổn định, vì vậy chúng ta phải tối ưu mã sao cho hiệu quả nhất có thể. Tốt hơn là có một tốc độ khung hình ổn định, không thay đổi liên tục hay đột ngột; để làm được điều này, bạn cần cho ít đối tượng cần thiết nhất có thể di chuyển vào cảnh, và (trong trường hợp WebGL) cố gắng giảm draw calls.

### Khoảng cách đồng tử (IPD)

Dựa trên định nghĩa của Wikipedia, IPD là khoảng cách giữa tâm đồng tử của hai mắt. IPD cực kỳ quan trọng trong thiết kế hệ thống hiển thị hai mắt, nơi đồng tử của cả hai mắt cần được đặt trong các exit pupil của hệ thống hiển thị.

Khoảng cách đồng tử (IPD) có thể được tính bằng {{domxref("VREyeParameters.offset")}} trong WebVR, giá trị này bằng một nửa IPD.

Giá trị này do HMD trả về và thường vào khoảng 60 đến 70 mm; với một số HMD như Oculus Rift, bạn có thể đặt IPD riêng. Thông thường chúng ta không thay đổi giá trị này nhưng bạn có thể thử thay đổi nó để đổi tỷ lệ của toàn bộ cảnh. Ví dụ, nếu IPD được đặt thành 6000 mm, người dùng sẽ nhìn cảnh như một người khổng lồ đang nhìn thế giới của Lilliputian.

### Bậc tự do (DoF)

DoF đề cập đến chuyển động của một vật rắn trong không gian. Không có sự thống nhất khi tạo viết tắt cho thuật ngữ này - chúng ta có thể thấy các tham chiếu tới 3DoF trong ngữ cảnh cảm biến chỉ phát hiện theo dõi đầu quay, và 6DoF khi một đầu vào cho phép chúng ta điều khiển đồng thời vị trí và hướng. Thậm chí đôi khi còn thấy 9DoF khi phần cứng chứa ba cảm biến như con quay hồi chuyển, gia tốc kế và từ kế, nhưng kết quả của 3 x 3DoF thực ra sẽ trả về một tracking 6 bậc tự do.

DoF liên quan trực tiếp tới việc theo dõi chuyển động đầu của người dùng.

### Hình nón tập trung

Mặc dù trường nhìn của chúng ta lớn hơn nhiều (khoảng 180º), chúng ta cần lưu ý rằng chỉ trong một phần nhỏ của trường đó bạn mới có thể nhận ra ký hiệu (phần trung tâm 60º) hoặc đọc văn bản (phần trung tâm 10º). Nếu bạn không có cảm biến theo dõi mắt, chúng ta giả định trung tâm của màn hình là nơi người dùng đang tập trung mắt.

Giới hạn này rất quan trọng khi quyết định đặt hình ảnh ở đâu trên canvas ứng dụng - đặt quá sát mép của hình nón tập trung có thể dẫn đến mỏi mắt nhanh hơn nhiều.

### Âm thanh vị trí 3D

Âm thanh vị trí 3D đề cập đến một nhóm hiệu ứng thao tác âm thanh để mô phỏng nó sẽ nghe như thế nào trong không gian ba chiều.

Điều này liên quan trực tiếp tới [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), cho phép chúng ta đặt âm thanh lên các đối tượng có trong canvas hoặc phát âm thanh tùy theo phần của cảnh mà người dùng đang đi tới hoặc nhìn vào.
