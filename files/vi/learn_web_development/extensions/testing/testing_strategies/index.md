---
title: Chiến lược thực hiện kiểm thử
short-title: Chiến lược kiểm thử
slug: Learn_web_development/Extensions/Testing/Testing_strategies
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Introduction","Learn_web_development/Extensions/Testing/HTML_and_CSS", "Learn_web_development/Extensions/Testing")}}

Bài viết này giải thích cách thực hiện kiểm thử đa trình duyệt: cách chọn trình duyệt và thiết bị để kiểm thử, cách thực sự kiểm thử các trình duyệt và thiết bị đó, và cách kiểm thử với các nhóm người dùng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>; có ý tưởng về các
        <a
          href="/en-US/docs/Learn_web_development/Extensions/Testing/Introduction"
          >nguyên tắc cấp cao của kiểm thử đa trình duyệt</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Đạt được hiểu biết về các khái niệm cấp cao liên quan đến kiểm thử đa trình duyệt.
      </td>
    </tr>
  </tbody>
</table>

## Chọn trình duyệt và thiết bị nào để kiểm thử

Vì bạn không thể kiểm thử mọi kết hợp trình duyệt và thiết bị, điều đủ là bạn đảm bảo trang web của mình hoạt động trên những trình duyệt quan trọng nhất. Trong các ứng dụng thực tế, "quan trọng" thường có nghĩa là "thường được sử dụng trong đối tượng mục tiêu."

Bạn có thể phân loại trình duyệt và thiết bị theo mức độ hỗ trợ bạn dự định cung cấp. Ví dụ:

1. Hạng A: Trình duyệt phổ biến/hiện đại — Được biết là có khả năng. Kiểm thử kỹ lưỡng và cung cấp hỗ trợ đầy đủ.
2. Hạng B: Trình duyệt cũ hơn/ít khả năng hơn — được biết là không đủ khả năng. Kiểm thử và cung cấp trải nghiệm cơ bản hơn cho phép truy cập đầy đủ vào thông tin và dịch vụ cốt lõi.
3. Hạng C: Trình duyệt hiếm/chưa biết — đừng kiểm thử, nhưng giả sử chúng có khả năng. Phục vụ trang web đầy đủ, vốn sẽ hoạt động, ít nhất là với các phương án dự phòng được cung cấp bởi mã phòng thủ của chúng ta.

Trong các phần sau, chúng ta sẽ xây dựng một biểu đồ hỗ trợ theo định dạng này.

> [!NOTE]
> Yahoo là người đầu tiên phổ biến cách tiếp cận này, với phương pháp [Graded browser Support](https://github.com/yui/yui3/wiki/Graded-Browser-Support) của họ.

### Dự đoán các trình duyệt được sử dụng phổ biến nhất của đối tượng

Điều này thường liên quan đến việc đưa ra phỏng đoán có cơ sở dựa trên nhân khẩu học người dùng. Ví dụ, giả sử người dùng của bạn ở Bắc Mỹ và Tây Âu:

Một tìm kiếm nhanh trực tuyến cho bạn biết rằng hầu hết mọi người ở Bắc Mỹ và Tây Âu sử dụng máy tính để bàn/máy tính xách tay Windows hoặc Mac, nơi các trình duyệt chính là Chrome, Firefox, Safari và Edge. Bạn có thể muốn chỉ kiểm thử các phiên bản mới nhất của các trình duyệt này, vì các trình duyệt này được cập nhật thường xuyên. Tất cả chúng nên ở trong tầng hạng A.

Hầu hết mọi người trong nhóm nhân khẩu học này cũng sử dụng điện thoại iOS hoặc Android, vì vậy bạn có thể muốn kiểm thử các phiên bản mới nhất của iOS Safari, một vài phiên bản cuối của trình duyệt Android stock cũ, và Chrome và Firefox cho iOS và Android. Lý tưởng là bạn nên kiểm thử trên cả điện thoại và máy tính bảng, để đảm bảo thiết kế đáp ứng hoạt động.

Opera Mini không có khả năng chạy JavaScript phức tạp, vì vậy chúng ta nên đưa nó vào hạng B.

Do đó, chúng ta đã dựa trên lựa chọn trình duyệt để kiểm thử dựa trên các trình duyệt mà chúng ta mong đợi người dùng của mình sử dụng.
Điều này cho chúng ta biểu đồ hỗ trợ sau đây cho đến nay:

1. Hạng A: Chrome và Firefox cho Windows/Mac, Safari cho Mac, Edge cho Windows, iOS Safari cho iPhone/iPad, trình duyệt Android stock (hai phiên bản cuối) trên điện thoại/máy tính bảng, Chrome và Firefox cho Android (hai phiên bản cuối) trên điện thoại/máy tính bảng
2. Hạng B: Opera Mini
3. Hạng C: không có

Nếu đối tượng mục tiêu của bạn chủ yếu ở nơi khác, thì các trình duyệt và hệ điều hành phổ biến nhất có thể khác với những trình duyệt trên.

> [!NOTE]
> "Giám đốc điều hành của công ty tôi sử dụng Blackberry, vì vậy chúng ta nên đảm bảo rằng nó trông đẹp trên đó" cũng có thể là điều cần xem xét.

### Thống kê trình duyệt

Một số trang web cho thấy trình duyệt nào phổ biến ở một khu vực nhất định. Ví dụ, [Statcounter](https://gs.statcounter.com/) cho biết xu hướng ở Bắc Mỹ.

### Sử dụng phân tích

Một nguồn dữ liệu chính xác hơn nhiều, nếu bạn có thể có được, là một ứng dụng phân tích như [Google Analytics](https://marketingplatform.google.com/about/analytics/), cho bạn biết chính xác trình duyệt mọi người đang sử dụng để duyệt trang web của bạn. Tất nhiên, điều này phụ thuộc vào việc bạn đã có trang web để sử dụng, vì vậy không tốt cho các trang web hoàn toàn mới.

Bạn cũng có thể xem xét sử dụng các nền tảng phân tích mã nguồn mở và tập trung vào quyền riêng tư như [Open Web Analytics](https://www.openwebanalytics.com/) và [Matomo](https://matomo.org/). Chúng yêu cầu bạn tự lưu trữ nền tảng phân tích.

#### Thiết lập Google Analytics

1. Trước hết, bạn cần có tài khoản Google. Sử dụng tài khoản này để đăng nhập vào [Google Analytics](https://marketingplatform.google.com/about/analytics/).
2. Chọn tùy chọn [Google Analytics](https://analytics.google.com/analytics/web/) (web), và nhấp vào nút _Sign Up_.
3. Nhập thông tin trang web/ứng dụng của bạn vào trang đăng ký. Điều này khá trực quan để thiết lập; trường quan trọng nhất để làm đúng là URL trang web. Đây cần là URL gốc của trang web/ứng dụng của bạn.
4. Khi bạn đã điền xong mọi thứ, nhấn nút _Get Tracking ID_, sau đó chấp nhận các điều khoản dịch vụ xuất hiện.
5. Trang tiếp theo cung cấp cho bạn một số đoạn mã và các hướng dẫn khác. Đối với một trang web cơ bản, những gì bạn cần làm là sao chép khối mã _Website tracking_ và dán nó vào tất cả các trang khác nhau mà bạn muốn theo dõi bằng Google Analytics trên trang web của mình. Bạn có thể đặt các đoạn trích dưới thẻ đóng `</body>` của bạn, hoặc ở nơi khác thích hợp giữ cho chúng không bị lẫn lộn với mã ứng dụng của bạn.
6. Tải lên các thay đổi lên máy chủ phát triển, hoặc bất kỳ nơi nào khác mà bạn cần mã của mình.

Đó là tất cả! Trang web của bạn bây giờ sẽ sẵn sàng để bắt đầu báo cáo dữ liệu phân tích.

#### Nghiên cứu dữ liệu phân tích

Bây giờ bạn sẽ có thể quay lại trang chủ [Analytics Web](https://analytics.google.com/analytics/web/), và bắt đầu xem xét dữ liệu bạn đã thu thập về trang web của mình (tất nhiên bạn cần để lại một khoảng thời gian để một số dữ liệu thực sự được thu thập).

Theo mặc định, bạn sẽ thấy tab báo cáo.

Có rất nhiều dữ liệu bạn có thể xem xét bằng Google Analytics — báo cáo tùy chỉnh trong các danh mục khác nhau, v.v. — và chúng ta không có thời gian để thảo luận tất cả.
[Getting started with Analytics](https://support.google.com/analytics/answer/9304153) cung cấp một số hướng dẫn hữu ích về báo cáo (và nhiều hơn nữa) cho người mới bắt đầu.

Bạn có thể xem trình duyệt và hệ điều hành người dùng của bạn đang sử dụng bằng cách chọn _Audience > Technology > Browser & OS_ từ menu bên trái.

> [!NOTE]
> Khi sử dụng Google Analytics, bạn cần chú ý đến sự thiên lệch gây hiểu nhầm, ví dụ: "Chúng ta không có người dùng Firefox Mobile" có thể khiến bạn không bận tâm hỗ trợ Firefox mobile. Nhưng bạn sẽ không có người dùng Firefox Mobile nào nếu trang web bị lỗi trên Firefox mobile ngay từ đầu.

### Các cân nhắc khác

Bạn nên bao gồm khả năng truy cập như một yêu cầu kiểm thử hạng A.

Ngoài ra, bạn nên nhận thức về các nhu cầu đặc thù của tình huống. Ví dụ, nếu sản phẩm của bạn nhắm vào thị trường nơi điện thoại di động là phương tiện chính để truy cập internet, bạn có thể muốn ưu tiên hỗ trợ trình duyệt di động.

### Biểu đồ hỗ trợ cuối cùng

Vì vậy, biểu đồ hỗ trợ cuối cùng của chúng ta sẽ trông như sau:

1. Hạng A: Chrome và Firefox cho Windows/Mac, Safari cho Mac, và Edge (hai phiên bản cuối mỗi loại), iOS Safari cho iPhone/iPad, trình duyệt Android stock (hai phiên bản cuối) trên điện thoại/máy tính bảng, Chrome và Firefox cho Android (hai phiên bản cuối) trên điện thoại máy tính bảng. Khả năng truy cập vượt qua các bài kiểm thử phổ biến.
2. Hạng B: Opera Mini.
3. Hạng C: Opera, các trình duyệt hiện đại đặc biệt khác.

## Bạn sẽ kiểm thử gì?

Khi bạn có một bổ sung mới vào cơ sở mã cần kiểm thử, trước khi bắt đầu kiểm thử bạn nên viết ra danh sách các yêu cầu kiểm thử cần vượt qua để được chấp nhận. Các yêu cầu này có thể là trực quan hoặc chức năng — cả hai kết hợp để tạo ra một tính năng trang web có thể sử dụng được.

Hãy xem xét ví dụ sau (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/strategies/hidden-info-panel.html), và cũng là [ví dụ đang chạy trực tiếp](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/strategies/hidden-info-panel.html)):

Tiêu chí kiểm thử cho tính năng này có thể được viết như sau:

Hạng A và B:

- Nút nên có thể được kích hoạt bởi cơ chế điều khiển chính của người dùng, dù đó là gì — điều này nên bao gồm chuột, bàn phím và cảm ứng.
- Chuyển đổi nút sẽ làm cho hộp thông tin xuất hiện/biến mất.
- Văn bản phải có thể đọc được.
- Người dùng khiếm thị sử dụng trình đọc màn hình phải có thể truy cập văn bản.

Hạng A:

- Hộp thông tin nên tạo hiệu ứng mượt mà khi xuất hiện/biến mất.
- Gradient và bóng văn bản nên xuất hiện để nâng cao giao diện của hộp.

Bạn có thể nhận thấy rằng nút không thể sử dụng chỉ với bàn phím. Chúng ta có thể khắc phục điều này bằng cách sử dụng JavaScript để thực hiện điều khiển bàn phím cho nút chuyển đổi, hoặc sử dụng một cách tiếp cận khác.

Các tiêu chí kiểm thử này rất hữu ích vì:

- Chúng cung cấp cho bạn một tập hợp các bước để làm theo khi bạn thực hiện kiểm thử.
- Chúng có thể dễ dàng chuyển thành các bộ hướng dẫn cho các nhóm người dùng làm theo khi thực hiện kiểm thử (ví dụ: "hãy thử kích hoạt nút bằng chuột, sau đó bằng bàn phím…") — xem [Kiểm thử người dùng](#user_testing), bên dưới.
- Chúng cũng có thể cung cấp cơ sở để viết các bài kiểm thử tự động. Dễ dàng hơn để viết các bài kiểm thử như vậy nếu bạn biết chính xác những gì bạn muốn kiểm thử và điều kiện thành công là gì (xem [Selenium](/en-US/docs/Learn_web_development/Extensions/Testing/Your_own_automation_environment#selenium), sau trong loạt bài).

## Lắp ráp phòng thí nghiệm kiểm thử

Một tùy chọn để thực hiện kiểm thử trình duyệt là tự thực hiện kiểm thử. Để làm điều này, bạn có thể sẽ sử dụng kết hợp các thiết bị vật lý thực tế và môi trường mô phỏng (sử dụng trình mô phỏng hoặc máy ảo).

### Thiết bị vật lý

Nói chung tốt hơn khi có thiết bị thực chạy trình duyệt bạn muốn kiểm thử — điều này cung cấp độ chính xác cao nhất về hành vi và trải nghiệm người dùng tổng thể. Bạn có thể muốn có những thiết bị sau, cho một phòng thí nghiệm thiết bị cấp thấp hợp lý:

- Máy Mac, với các trình duyệt được cài đặt mà bạn cần kiểm thử — điều này có thể bao gồm Firefox, Chrome, Opera và Safari.
- Máy tính Windows, với các trình duyệt được cài đặt mà bạn cần kiểm thử — điều này có thể bao gồm Edge (hoặc IE), Chrome, Firefox và Opera.
- Điện thoại Android và máy tính bảng cấu hình cao hơn với trình duyệt được cài đặt mà bạn cần kiểm thử — điều này có thể bao gồm Chrome, Firefox và Opera Mini cho Android, cũng như trình duyệt Android stock ban đầu.
- Điện thoại iOS và máy tính bảng cấu hình cao hơn với các trình duyệt được cài đặt mà bạn cần kiểm thử — điều này có thể bao gồm iOS Safari, Chrome, Firefox và Opera Mini cho iOS.

Các thiết bị sau đây cũng là tùy chọn tốt, nếu bạn có thể kiếm được:

- Máy tính Linux, trong trường hợp bạn cần kiểm thử các lỗi đặc thù cho các phiên bản trình duyệt Linux. Người dùng Linux thường sử dụng Firefox, Opera và Chrome. Nếu bạn chỉ có một máy, bạn có thể xem xét tạo máy khởi động kép chạy Linux và Windows trên các phân vùng riêng biệt.
- Một vài thiết bị di động cấu hình thấp hơn, để bạn có thể kiểm thử hiệu suất của các tính năng như hiệu ứng động trên bộ xử lý kém mạnh hơn.

Máy làm việc chính của bạn cũng có thể là nơi để cài đặt các công cụ khác cho các mục đích cụ thể, chẳng hạn như công cụ kiểm tra khả năng truy cập, trình đọc màn hình và trình mô phỏng/máy ảo.

Một số công ty lớn hơn có phòng thí nghiệm thiết bị chứa rất nhiều thiết bị khác nhau, cho phép các nhà phát triển tìm ra lỗi trên các kết hợp trình duyệt/thiết bị rất cụ thể. Các công ty nhỏ hơn và cá nhân thường không đủ khả năng chi trả cho phòng thí nghiệm tinh vi như vậy, vì vậy có xu hướng sử dụng các phòng thí nghiệm nhỏ hơn, trình mô phỏng, máy ảo và các ứng dụng kiểm thử thương mại.

Chúng ta sẽ đề cập đến từng tùy chọn khác bên dưới.

> [!NOTE]
> Một số nỗ lực đã được thực hiện để tạo ra các phòng thí nghiệm thiết bị có thể truy cập công khai — xem [Open Device Labs](https://www.smashingmagazine.com/2016/11/worlds-best-open-device-labs/).

> [!NOTE]
> Chúng ta cũng cần xem xét khả năng truy cập — có một số công cụ hữu ích bạn có thể cài đặt trên máy của mình để tạo điều kiện kiểm thử khả năng truy cập, nhưng chúng ta sẽ đề cập đến những điều đó trong bài viết Xử lý các vấn đề khả năng truy cập phổ biến, sau trong khóa học.

### Trình mô phỏng

Trình mô phỏng về cơ bản là các chương trình chạy bên trong máy tính của bạn và mô phỏng một thiết bị hoặc các điều kiện thiết bị cụ thể nào đó, cho phép bạn thực hiện một số kiểm thử của mình thuận tiện hơn so với việc phải tìm kiếm sự kết hợp cụ thể của phần cứng/phần mềm để kiểm thử.

Một trình mô phỏng có thể đơn giản như kiểm thử điều kiện thiết bị. Ví dụ, nếu bạn muốn thực hiện một số kiểm thử nhanh về các media query chiều rộng/chiều cao cho thiết kế đáp ứng, bạn có thể sử dụng [Responsive Design Mode](https://firefox-source-docs.mozilla.org/devtools-user/responsive_design_mode/index.html) của Firefox. Safari cũng có chế độ tương tự, có thể được bật bằng cách vào _Safari > Preferences_, và chọn _Show Develop menu_, sau đó chọn _Develop > Enter Responsive Design Mode_. Chrome cũng có tính năng tương tự: Device mode (xem [Simulate Mobile Devices with Device Mode](https://developer.chrome.com/docs/devtools/device-mode/)).

Tuy nhiên, thường bạn sẽ phải cài đặt một số loại trình mô phỏng. Các thiết bị/trình duyệt phổ biến nhất bạn sẽ muốn kiểm thử như sau:

- [Android Studio IDE](https://developer.android.com/studio/) chính thức để phát triển ứng dụng Android hơi nặng để chỉ kiểm thử trang web trên Google Chrome hoặc trình duyệt Android Stock cũ, nhưng nó đi kèm với [trình mô phỏng](https://developer.android.com/studio/run/emulator.html) mạnh mẽ. Nếu bạn muốn thứ gì đó nhẹ hơn, [Andy](https://www.andyroid.net/) là tùy chọn hợp lý chạy trên cả Windows và Mac.
- Apple cung cấp ứng dụng gọi là [Simulator](https://help.apple.com/simulator/mac/current/) chạy trên môi trường phát triển [Xcode](https://developer.apple.com/xcode/), và mô phỏng iPad/iPhone/Apple Watch/Apple TV. Điều này bao gồm trình duyệt iOS Safari gốc. Tiếc là nó chỉ chạy trên Mac.

Bạn thường có thể tìm thấy trình mô phỏng cho các môi trường thiết bị di động khác, ví dụ:

- Bạn có thể mô phỏng Opera Mini riêng nếu bạn muốn kiểm thử nó.

> [!NOTE]
> Nhiều trình mô phỏng thực sự yêu cầu sử dụng máy ảo (xem bên dưới); khi đó, hướng dẫn thường được cung cấp, và/hoặc việc sử dụng máy ảo được tích hợp vào trình cài đặt của trình mô phỏng.

### Máy ảo

Máy ảo là các ứng dụng chạy trên máy tính để bàn của bạn và cho phép bạn chạy mô phỏng các hệ điều hành hoàn chỉnh, mỗi hệ điều hành được ngăn cách trong ổ đĩa ảo riêng (thường được biểu diễn bằng một tệp lớn duy nhất tồn tại trên ổ đĩa của máy chủ). Có một số ứng dụng máy ảo phổ biến, chẳng hạn như [Parallels](https://www.parallels.com/), [VMware](https://www.vmware.com/) và [Virtual Box](https://www.virtualbox.org/wiki/Downloads); chúng ta cá nhân thích cái sau, vì nó miễn phí.

> [!NOTE]
> Bạn cần nhiều không gian đĩa cứng để chạy các mô phỏng máy ảo; mỗi hệ điều hành bạn mô phỏng có thể chiếm rất nhiều bộ nhớ. Bạn có xu hướng chọn không gian đĩa cứng bạn muốn cho mỗi lần cài đặt; bạn có thể thoát với khoảng 10GB, nhưng một số nguồn khuyến nghị tối đa 50GB hoặc nhiều hơn, để hệ điều hành chạy đáng tin cậy. Một tùy chọn tốt được cung cấp bởi hầu hết các ứng dụng máy ảo là tạo ổ đĩa cứng **được phân bổ động** phát triển và thu hẹp khi cần.

Để sử dụng Virtual Box, bạn cần:

1. Lấy đĩa cài đặt hoặc ảnh (ví dụ: tệp ISO) cho hệ điều hành bạn muốn mô phỏng. Virtual Box không thể cung cấp những thứ này; hầu hết, như các hệ điều hành Windows, là sản phẩm thương mại không thể phân phối tự do.
2. [Tải xuống trình cài đặt thích hợp](https://www.virtualbox.org/wiki/Downloads) cho hệ điều hành của bạn và cài đặt nó.
3. Mở ứng dụng; bạn sẽ được trình bày với một giao diện.
4. Để tạo máy ảo mới, nhấn nút _New_ ở góc trên bên trái.
5. Làm theo hướng dẫn và điền vào các hộp thoại sau như phù hợp. Bạn sẽ:
   1. Cung cấp tên cho máy ảo mới
   2. Chọn hệ điều hành và phiên bản bạn đang cài đặt trên đó
   3. Đặt bao nhiêu RAM nên được phân bổ (chúng ta khuyến nghị khoảng 2048MB, hoặc 2GB)
   4. Tạo ổ đĩa ảo (chọn các tùy chọn mặc định qua ba hộp thoại chứa _Create a virtual hard disk now_, _VDI (virtual disk image)_ và _Dynamically allocated_).
   5. Chọn vị trí tệp và kích thước cho ổ đĩa cứng ảo (chọn tên và vị trí hợp lý để giữ nó, và cho kích thước chỉ định khoảng 50GB, hoặc nhiều như bạn cảm thấy thoải mái khi chỉ định).

Bây giờ hộp ảo mới sẽ xuất hiện trong menu bên trái của cửa sổ UI Virtual Box chính. Tại thời điểm này, bạn có thể nhấp đúp để mở nó — nó sẽ bắt đầu khởi động máy ảo, nhưng nó chưa có hệ điều hành (OS) được cài đặt. Tại thời điểm này bạn cần trỏ hộp thoại đến ảnh/đĩa cài đặt, và nó sẽ chạy qua các bước để cài đặt OS như trên máy vật lý.

> [!WARNING]
> Bạn cần đảm bảo rằng bạn có ảnh hệ điều hành bạn muốn cài đặt trên máy ảo sẵn sàng tại thời điểm này và cài đặt ngay lập tức. Nếu bạn hủy quá trình tại thời điểm này, nó có thể làm cho máy ảo không thể sử dụng được và khiến bạn phải xóa và tạo lại nó. Điều này không nghiêm trọng, nhưng thật khó chịu.

Sau khi quá trình hoàn tất, bạn sẽ có máy ảo chạy hệ điều hành bên trong cửa sổ trên máy tính chủ của bạn.

Bạn cần đối xử với bản cài đặt hệ điều hành ảo này như bạn sẽ đối xử với bất kỳ bản cài đặt thực nào — ví dụ, cũng như cài đặt các trình duyệt bạn muốn kiểm thử, hãy cài đặt chương trình chống virus để bảo vệ nó khỏi virus.

Có nhiều máy ảo rất hữu ích, đặc biệt để kiểm thử Windows IE/Edge — trên Windows, bạn không thể có nhiều phiên bản của trình duyệt mặc định được cài đặt cạnh nhau, vì vậy bạn có thể muốn xây dựng một thư viện máy ảo để xử lý các bài kiểm thử khác nhau khi cần, ví dụ:

- Windows 10 với Edge 14
- Windows 10 với Edge 13

> [!NOTE]
> Một điều tốt khác về máy ảo là các ảnh đĩa ảo khá độc lập. Nếu bạn đang làm việc trong nhóm, bạn có thể tạo một ảnh đĩa ảo, sau đó sao chép nó và truyền nó cho nhau. Chỉ cần đảm bảo bạn có các giấy phép cần thiết để chạy tất cả các bản sao của Windows hoặc bất cứ thứ gì khác bạn đang chạy nếu đó là sản phẩm có giấy phép.

### Tự động hóa và ứng dụng thương mại

Như đã đề cập trong chương trước, bạn có thể bớt đi rất nhiều nỗi đau trong kiểm thử trình duyệt bằng cách sử dụng một số loại hệ thống tự động hóa. Bạn có thể thiết lập hệ thống tự động hóa kiểm thử của riêng bạn ([Selenium](https://www.selenium.dev/) là ứng dụng phổ biến được lựa chọn), điều này cần một chút thiết lập, nhưng có thể rất hữu ích khi bạn làm ra nó.

Ngoài ra còn có các công cụ thương mại như [Sauce Labs](https://saucelabs.com/) và [Browser Stack](https://www.browserstack.com/) làm điều này cho bạn, mà không cần bạn lo lắng về việc thiết lập, nếu bạn muốn đầu tư một số tiền vào kiểm thử của mình.

Một giải pháp thay thế khác là sử dụng các công cụ tự động hóa kiểm thử không cần mã như [Endtest](https://www.endtest.io/).

Chúng ta sẽ xem xét cách sử dụng các công cụ như vậy sau này trong mô-đun.

## Kiểm thử người dùng

Trước khi tiếp tục, chúng ta sẽ kết thúc bài viết này bằng cách nói một chút về kiểm thử người dùng — đây có thể là tùy chọn tốt nếu bạn có nhóm người dùng sẵn sàng để kiểm thử chức năng mới của bạn. Hãy nhớ rằng điều này có thể đơn giản hoặc tinh vi tùy ý — nhóm người dùng của bạn có thể là nhóm bạn bè, nhóm đồng nghiệp, hoặc một nhóm tình nguyện viên không được trả lương hoặc được trả lương, tùy thuộc vào việc bạn có tiền để chi tiêu vào kiểm thử hay không.

Thông thường, bạn sẽ cho người dùng xem trang hoặc giao diện chứa chức năng mới trên một số loại máy chủ phát triển, để bạn không đưa trang web cuối cùng hoặc thay đổi trực tiếp cho đến khi hoàn thành. Bạn nên yêu cầu họ làm theo một số bước và báo cáo kết quả họ nhận được. Thật hữu ích khi cung cấp một tập hợp các bước (đôi khi được gọi là kịch bản) để bạn nhận được kết quả đáng tin cậy hơn liên quan đến những gì bạn đang cố kiểm thử. Chúng ta đã đề cập đến điều này trong phần [Bạn sẽ kiểm thử gì](#what_are_you_going_to_test) ở trên — dễ dàng chuyển các tiêu chí kiểm thử chi tiết ở đó thành các bước cần làm theo. Ví dụ, các bước sau sẽ phù hợp cho người dùng có thị lực:

- Nhấp vào nút dấu chấm hỏi bằng chuột trên máy tính để bàn của bạn vài lần. Làm mới cửa sổ trình duyệt.
- Chọn và kích hoạt nút dấu chấm hỏi bằng bàn phím trên máy tính để bàn của bạn vài lần.
- Nhấn vào nút dấu chấm hỏi vài lần trên thiết bị màn hình cảm ứng của bạn.
- Chuyển đổi nút sẽ làm cho hộp thông tin xuất hiện/biến mất. Nó có làm điều này trong mỗi ba trường hợp trên không?
- Văn bản có thể đọc được không?
- Hộp thông tin có tạo hiệu ứng mượt mà khi xuất hiện/biến mất không?

Khi chạy kiểm thử, cũng có thể là ý tưởng tốt khi:

- Thiết lập hồ sơ trình duyệt riêng nếu có thể, với các tiện ích mở rộng trình duyệt và những thứ khác bị tắt, và chạy kiểm thử của bạn trong hồ sơ đó (xem [Use the Profile Manager to create and remove Firefox profiles](https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles) và [Share Chrome with others or add personas](https://support.google.com/chrome/answer/2364824), ví dụ).
- Sử dụng chức năng chế độ riêng tư của trình duyệt khi chạy kiểm thử, nơi có (ví dụ: [Private Browsing](https://support.mozilla.org/en-US/kb/private-browsing-use-firefox-without-history) trong Firefox, [Incognito Mode](https://support.google.com/chrome/answer/95464) trong Chrome) để những thứ như cookie và tệp tạm thời không được lưu.

Các bước này được thiết kế để đảm bảo trình duyệt bạn đang kiểm thử càng "thuần túy" càng tốt, tức là không có gì được cài đặt có thể ảnh hưởng đến kết quả kiểm thử.

> [!NOTE]
> Một tùy chọn hữu ích khác với chi phí thấp, nếu bạn có phần cứng, là kiểm thử trang web của bạn trên các điện thoại/thiết bị cấp thấp — khi các trang web ngày càng lớn hơn và có thêm nhiều hiệu ứng hơn, có khả năng cao hơn là trang web sẽ chậm lại, vì vậy bạn cần bắt đầu chú ý nhiều hơn đến hiệu suất. Cố gắng làm cho chức năng của bạn hoạt động trên thiết bị cấp thấp sẽ làm cho trải nghiệm có khả năng tốt trên các thiết bị cấp cao hơn.

> [!NOTE]
> Một số môi trường phát triển phía máy chủ cung cấp các cơ chế hữu ích để triển khai thay đổi trang web chỉ cho một tập hợp con người dùng, cung cấp cơ chế hữu ích để kiểm thử tính năng bởi một tập hợp con người dùng mà không cần máy chủ phát triển riêng. Một ví dụ là [Django Waffle Flags](https://github.com/django-waffle/django-waffle).

## Tóm tắt

Sau khi đọc bài viết này, bạn sẽ có ý tưởng tốt về những gì bạn có thể làm để xác định đối tượng mục tiêu/danh sách trình duyệt mục tiêu, và sau đó thực hiện kiểm thử đa trình duyệt hiệu quả trên danh sách đó.

Tiếp theo, chúng ta sẽ chuyển sự chú ý đến các vấn đề mã thực tế mà kiểm thử của bạn có thể phát hiện ra, bắt đầu với HTML và CSS.

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Introduction","Learn_web_development/Extensions/Testing/HTML_and_CSS", "Learn_web_development/Extensions/Testing")}}
