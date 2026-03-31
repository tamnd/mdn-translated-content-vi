---
title: Bảo mật trang web
slug: Learn_web_development/Extensions/Server-side/First_steps/Website_security
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Server-side/First_steps/Web_frameworks", "Learn_web_development/Extensions/Server-side/First_steps")}}

Bảo mật trang web đòi hỏi sự cảnh giác trong tất cả các khía cạnh của thiết kế và sử dụng trang web. Bài viết giới thiệu này sẽ không biến bạn thành chuyên gia bảo mật trang web, nhưng nó sẽ giúp bạn hiểu các mối đe dọa đến từ đâu, và những gì bạn có thể làm để tăng cường bảo mật ứng dụng web của bạn chống lại các cuộc tấn công phổ biến nhất.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Kiến thức cơ bản về máy tính.</td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để hiểu các mối đe dọa phổ biến nhất đối với bảo mật ứng dụng web và
        những gì bạn có thể làm để giảm nguy cơ trang web của bạn bị tấn công.
      </td>
    </tr>
  </tbody>
</table>

## Bảo mật trang web là gì?

Internet là một nơi nguy hiểm! Với tần suất lớn, chúng ta nghe về các trang web không khả dụng do các cuộc tấn công từ chối dịch vụ, hoặc hiển thị thông tin đã sửa đổi (và thường gây hại) trên trang chủ của chúng. Trong các trường hợp nổi tiếng khác, hàng triệu mật khẩu, địa chỉ email, và thông tin thẻ tín dụng đã bị rò rỉ vào miền công cộng, khiến người dùng trang web phải đối mặt với cả sự xấu hổ cá nhân và rủi ro tài chính.

Mục đích của bảo mật trang web là ngăn chặn những loại tấn công (hoặc bất kỳ loại tấn công nào) này. Định nghĩa chính thức hơn về bảo mật trang web _là hành động/thực hành bảo vệ các trang web khỏi truy cập, sử dụng, sửa đổi, phá hủy, hoặc gián đoạn trái phép_.

Bảo mật trang web hiệu quả đòi hỏi nỗ lực thiết kế trên toàn bộ trang web: trong ứng dụng web của bạn, cấu hình máy chủ web, chính sách của bạn để tạo và gia hạn mật khẩu, và mã phía máy khách. Mặc dù tất cả những điều đó nghe có vẻ đáng sợ, tin tốt là nếu bạn đang sử dụng framework web phía máy chủ, nó gần như chắc chắn sẽ bật "theo mặc định" các cơ chế phòng thủ mạnh mẽ và được suy nghĩ kỹ chống lại một số cuộc tấn công phổ biến hơn. Các cuộc tấn công khác có thể được giảm thiểu thông qua cấu hình máy chủ web của bạn, ví dụ bằng cách bật HTTPS. Cuối cùng, có các công cụ quét lỗ hổng có sẵn công khai có thể giúp bạn tìm hiểu xem bạn đã mắc bất kỳ lỗi rõ ràng nào không.

Phần còn lại của bài viết này cung cấp cho bạn thêm chi tiết về một số mối đe dọa phổ biến và một số bước đơn giản bạn có thể thực hiện để bảo vệ trang web của mình.

> [!NOTE]
> Đây là một chủ đề giới thiệu, được thiết kế để giúp bạn bắt đầu suy nghĩ về bảo mật trang web, nhưng nó không đầy đủ.

## Các mối đe dọa bảo mật trang web

Phần này liệt kê chỉ một số mối đe dọa trang web phổ biến nhất và cách chúng được giảm thiểu. Khi bạn đọc, hãy lưu ý cách các mối đe dọa thành công nhất khi ứng dụng web tin tưởng, hoặc _không đủ hoang mang_ về dữ liệu đến từ trình duyệt.

### Cross-Site Scripting (XSS)

XSS là thuật ngữ được sử dụng để mô tả một lớp các cuộc tấn công cho phép kẻ tấn công tiêm các script phía máy khách _thông qua_ trang web vào trình duyệt của người dùng khác. Vì mã được tiêm đến trình duyệt từ trang web, mã được _tin tưởng_ và có thể làm những việc như gửi cookie phân quyền trang web của người dùng đến kẻ tấn công. Khi kẻ tấn công có cookie, họ có thể đăng nhập vào trang web như thể họ là người dùng và làm bất cứ điều gì người dùng có thể, như truy cập thông tin thẻ tín dụng của họ, xem thông tin liên hệ, hoặc thay đổi mật khẩu.

> [!NOTE]
> Các lỗ hổng XSS đã lịch sử phổ biến hơn bất kỳ loại mối đe dọa bảo mật nào khác.

Các lỗ hổng XSS được chia thành _phản chiếu_ và _dai dẳng_, dựa trên cách trang web trả về các script được tiêm cho trình duyệt.

- Lỗ hổng XSS _phản chiếu_ xảy ra khi nội dung người dùng được chuyển đến máy chủ được trả về _ngay lập tức_ và _không sửa đổi_ để hiển thị trong trình duyệt. Bất kỳ script nào trong nội dung người dùng ban đầu sẽ được chạy khi trang mới được tải.
  Ví dụ, hãy xem xét chức năng tìm kiếm trang web nơi các từ khóa tìm kiếm được mã hóa là tham số URL, và các từ khóa này được hiển thị cùng với kết quả. Kẻ tấn công có thể xây dựng một liên kết tìm kiếm chứa một script độc hại làm tham số (ví dụ: `https://developer.mozilla.org?q=beer<script%20src="http://example.com/tricky.js"></script>`) và gửi email nó cho người dùng khác. Nếu người dùng mục tiêu nhấp vào "liên kết thú vị" này, script sẽ được thực thi khi kết quả tìm kiếm được hiển thị. Như đã thảo luận trước đó, điều này cung cấp cho kẻ tấn công tất cả thông tin họ cần để vào trang web như người dùng mục tiêu, có khả năng thực hiện mua hàng như người dùng hoặc chia sẻ thông tin liên hệ của họ.
- Lỗ hổng XSS _dai dẳng_ xảy ra khi script độc hại được _lưu trữ_ trên trang web và sau đó được hiển thị lại không sửa đổi cho người dùng khác thực thi không cố ý.
  Ví dụ, một diễn đàn thảo luận chấp nhận bình luận chứa HTML không sửa đổi có thể lưu trữ một script độc hại từ kẻ tấn công. Khi các bình luận được hiển thị, script được thực thi và có thể gửi cho kẻ tấn công thông tin cần thiết để truy cập tài khoản của người dùng. Loại tấn công này cực kỳ phổ biến và mạnh mẽ, vì kẻ tấn công thậm chí có thể không có bất kỳ tương tác trực tiếp nào với nạn nhân.

Mặc dù dữ liệu từ các yêu cầu `POST` hoặc `GET` là nguồn phổ biến nhất của các lỗ hổng XSS, bất kỳ dữ liệu nào từ trình duyệt đều có khả năng dễ bị tổn thương, chẳng hạn như dữ liệu cookie được hiển thị bởi trình duyệt, hoặc các tệp người dùng được tải lên và hiển thị.

Phòng thủ tốt nhất chống lại các lỗ hổng XSS là loại bỏ hoặc vô hiệu hóa bất kỳ đánh dấu nào có khả năng chứa các hướng dẫn để chạy mã. Đối với HTML, điều này bao gồm các phần tử, chẳng hạn như `<script>`, `<object>`, `<embed>`, và `<link>`.

Quá trình sửa đổi dữ liệu người dùng để nó không thể được sử dụng để chạy script hoặc ảnh hưởng đến việc thực thi mã máy chủ được gọi là làm sạch đầu vào. Nhiều framework web tự động làm sạch đầu vào người dùng từ các biểu mẫu HTML theo mặc định.

### SQL injection

Các lỗ hổng SQL injection cho phép người dùng độc hại thực thi mã SQL tùy ý trên cơ sở dữ liệu, cho phép dữ liệu được truy cập, sửa đổi, hoặc xóa bất kể quyền của người dùng. Một cuộc tấn công tiêm thành công có thể giả mạo danh tính, tạo các danh tính mới với quyền quản trị, truy cập tất cả dữ liệu trên máy chủ, hoặc phá hủy/sửa đổi dữ liệu để làm cho nó không thể sử dụng.

Các loại SQL injection bao gồm SQL injection dựa trên lỗi, SQL injection dựa trên lỗi boolean, và SQL injection dựa trên thời gian.

Lỗ hổng này có mặt nếu đầu vào người dùng được chuyển đến câu lệnh SQL bên dưới có thể thay đổi ý nghĩa của câu lệnh. Ví dụ, mã dưới đây được thiết kế để liệt kê tất cả người dùng có tên cụ thể (`userName`) đã được cung cấp từ biểu mẫu HTML:

```python
statement = "SELECT * FROM users WHERE name = '" + userName + "';"
```

Nếu người dùng chỉ định tên thực, câu lệnh sẽ hoạt động như dự định. Tuy nhiên, người dùng độc hại có thể hoàn toàn thay đổi hành vi của câu lệnh SQL này sang câu lệnh mới trong ví dụ sau, bằng cách chỉ định `a';DROP TABLE users; SELECT * FROM userinfo WHERE 't' = 't` cho `userName`.

```sql
SELECT * FROM users WHERE name = 'a';DROP TABLE users; SELECT * FROM userinfo WHERE 't' = 't';
```

Câu lệnh đã sửa đổi tạo ra câu lệnh SQL hợp lệ xóa bảng `users` và chọn tất cả dữ liệu từ bảng `userinfo` (tiết lộ thông tin của mọi người dùng). Điều này hoạt động vì phần đầu tiên của văn bản được tiêm (`a';`) hoàn thành câu lệnh ban đầu.

Để tránh các cuộc tấn công như vậy, thực hành tốt nhất là sử dụng các truy vấn được tham số hóa (câu lệnh chuẩn bị). Cách tiếp cận này đảm bảo rằng đầu vào người dùng được xử lý như một chuỗi dữ liệu thay vì SQL có thể thực thi, để người dùng không thể lạm dụng các ký tự cú pháp SQL đặc biệt để tạo ra các câu lệnh SQL không mong muốn. Sau đây là một ví dụ:

```sql
SELECT * FROM users WHERE name = ? AND password = ?;
```

Khi thực thi truy vấn trên, ví dụ, trong Python, chúng ta truyền `name` và `password` làm tham số, như được hiển thị dưới đây.

```python
cursor.execute("SELECT * FROM users WHERE name = ? AND password = ?", (name, password))
```

Các thư viện thường cung cấp các API được trừu tượng hóa tốt xử lý bảo vệ SQL injection cho nhà phát triển, chẳng hạn như các mô hình của Django. Bạn có thể tránh SQL injection bằng cách sử dụng các API được đóng gói thay vì trực tiếp viết SQL thô.

### Cross-Site Request Forgery (CSRF)

Các cuộc tấn công CSRF cho phép người dùng độc hại thực thi các hành động sử dụng thông tin xác thực của người dùng khác mà không có sự biết đến hoặc đồng ý của người dùng đó.

Loại tấn công này được giải thích tốt nhất bằng ví dụ. Josh là người dùng độc hại biết rằng một trang web cụ thể cho phép người dùng đã đăng nhập gửi tiền đến một tài khoản được chỉ định bằng cách sử dụng yêu cầu HTTP `POST` bao gồm tên tài khoản và số tiền. Josh xây dựng một biểu mẫu bao gồm thông tin ngân hàng của anh ta và một số tiền dưới dạng các trường ẩn, và gửi email nó cho người dùng trang web khác (với nút _Gửi_ được ngụy trang thành liên kết đến trang web "làm giàu nhanh").

Nếu người dùng nhấp vào nút gửi, một yêu cầu HTTP `POST` sẽ được gửi đến máy chủ chứa thông tin giao dịch và bất kỳ cookie phía máy khách nào mà trình duyệt liên kết với trang web (thêm cookie trang web liên quan vào các yêu cầu là hành vi trình duyệt bình thường). Máy chủ sẽ kiểm tra cookie và sử dụng chúng để xác định người dùng có đăng nhập không và có quyền thực hiện giao dịch không.

Kết quả là bất kỳ người dùng nào nhấp vào nút _Gửi_ trong khi họ đã đăng nhập vào trang giao dịch sẽ thực hiện giao dịch. Josh trở nên giàu có.

> [!NOTE]
> Mẹo ở đây là Josh không cần phải có quyền truy cập vào cookie của người dùng (hoặc thông tin xác thực truy cập). Trình duyệt của người dùng lưu trữ thông tin này và tự động bao gồm nó trong tất cả các yêu cầu đến máy chủ liên quan.

Một cách để ngăn loại tấn công này là máy chủ yêu cầu các yêu cầu `POST` bao gồm bí mật cụ thể của người dùng do trang web tạo ra. Bí mật sẽ được cung cấp bởi máy chủ khi gửi biểu mẫu web được sử dụng để thực hiện chuyển khoản. Cách tiếp cận này ngăn Josh tạo biểu mẫu của riêng mình, vì anh ta phải biết bí mật mà máy chủ đang cung cấp cho người dùng. Ngay cả khi anh ta tìm ra bí mật và tạo biểu mẫu cho người dùng cụ thể, anh ta sẽ không còn có thể sử dụng cùng biểu mẫu đó để tấn công mọi người dùng.

Các framework web thường bao gồm các cơ chế phòng ngừa CSRF như vậy.

### Các mối đe dọa khác

Các cuộc tấn công/lỗ hổng phổ biến khác bao gồm:

- [Clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking). Trong cuộc tấn công này, người dùng độc hại chiếm quyền các nhấp chuột dành cho trang web cấp trên hiển thị và định tuyến chúng đến trang ẩn bên dưới. Kỹ thuật này có thể được sử dụng, ví dụ, để hiển thị trang web ngân hàng hợp pháp nhưng thu thập thông tin xác thực đăng nhập vào {{htmlelement("iframe")}} vô hình được kiểm soát bởi kẻ tấn công. Clickjacking cũng có thể được sử dụng để khiến người dùng nhấp vào nút trên trang web hiển thị, nhưng khi làm như vậy, thực sự vô tình nhấp vào nút hoàn toàn khác. Như một biện pháp phòng thủ, trang web của bạn có thể ngăn chính nó được nhúng trong iframe trong trang web khác bằng cách đặt các tiêu đề HTTP thích hợp.
- [Từ chối dịch vụ](/en-US/docs/Glossary/Distributed_Denial_of_Service) (DoS). DoS thường đạt được bằng cách làm ngập trang web mục tiêu với các yêu cầu giả mạo để quyền truy cập vào trang web bị gián đoạn cho người dùng hợp pháp. Các yêu cầu có thể nhiều, hoặc chúng có thể tiêu thụ riêng lẻ lượng lớn tài nguyên (ví dụ: đọc chậm hoặc tải lên các tệp lớn). Các biện pháp phòng thủ DoS thường hoạt động bằng cách xác định và chặn lưu lượng "xấu" trong khi cho phép các thông điệp hợp pháp đi qua. Các biện pháp phòng thủ này thường được đặt trước hoặc trong máy chủ web (chúng không phải là một phần của ứng dụng web chính nó).
- [Directory Traversal](https://en.wikipedia.org/wiki/Directory_traversal_attack) (Tệp và tiết lộ). Trong cuộc tấn công này, người dùng độc hại cố gắng truy cập các phần của hệ thống tệp máy chủ web mà họ không được phép truy cập. Lỗ hổng này xảy ra khi người dùng có thể chuyển tên tệp bao gồm các ký tự điều hướng hệ thống tệp (ví dụ: `../../`). Giải pháp là làm sạch đầu vào trước khi sử dụng.
- [File Inclusion](https://en.wikipedia.org/wiki/File_inclusion_vulnerability). Trong cuộc tấn công này, người dùng có thể chỉ định tệp "không mong muốn" để hiển thị hoặc thực thi trong dữ liệu được chuyển đến máy chủ. Khi được tải, tệp này có thể được thực thi trên máy chủ web hoặc phía máy khách (dẫn đến cuộc tấn công XSS). Giải pháp là làm sạch đầu vào trước khi sử dụng.
- [Command Injection](https://owasp.org/www-community/attacks/Command_Injection). Các cuộc tấn công tiêm lệnh cho phép người dùng độc hại thực thi các lệnh hệ thống tùy ý trên hệ điều hành máy chủ. Giải pháp là làm sạch đầu vào người dùng trước khi nó có thể được sử dụng trong các cuộc gọi hệ thống.

Để có danh sách toàn diện các mối đe dọa bảo mật trang web, hãy xem [Danh mục: Khai thác bảo mật web](https://en.wikipedia.org/wiki/Category:Web_security_exploits) (Wikipedia) và [Danh mục: Tấn công](https://owasp.org/www-community/attacks/) (Dự án bảo mật ứng dụng web mở).

## Một số thông điệp chính

Hầu hết các khai thác bảo mật trong các phần trước thành công khi ứng dụng web tin tưởng dữ liệu từ trình duyệt. Bất cứ điều gì khác bạn làm để cải thiện bảo mật của trang web, bạn nên làm sạch tất cả dữ liệu có nguồn gốc từ người dùng trước khi nó được hiển thị trong trình duyệt, được sử dụng trong các truy vấn SQL, hoặc được chuyển đến cuộc gọi hệ điều hành hoặc hệ thống tệp.

> [!WARNING]
> Bài học quan trọng nhất bạn có thể học về bảo mật trang web là **không bao giờ tin tưởng dữ liệu từ trình duyệt**. Điều này bao gồm, nhưng không giới hạn ở dữ liệu trong tham số URL của các yêu cầu `GET`, các yêu cầu `POST`, tiêu đề HTTP và cookie, và các tệp do người dùng tải lên. Luôn kiểm tra và làm sạch tất cả dữ liệu đến. Luôn giả định điều tệ nhất.

Một số bước cụ thể khác bạn có thể thực hiện là:

- Sử dụng quản lý mật khẩu hiệu quả hơn. Khuyến khích mật khẩu mạnh. Xem xét xác thực hai yếu tố cho trang web của bạn, để ngoài mật khẩu, người dùng phải nhập mã xác thực khác (thường là mã được gửi qua một số phần cứng vật lý mà chỉ người dùng mới có, chẳng hạn như mã trong SMS được gửi đến điện thoại của họ).
- Cấu hình máy chủ web của bạn để sử dụng [HTTPS](/en-US/docs/Glossary/HTTPS) và [HTTP Strict Transport Security](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security) (HSTS). HTTPS mã hóa dữ liệu được gửi giữa máy khách và máy chủ của bạn. Điều này đảm bảo rằng thông tin xác thực đăng nhập, cookie, dữ liệu yêu cầu `POST` và thông tin tiêu đề không dễ dàng truy cập với kẻ tấn công.
- Theo dõi các mối đe dọa phổ biến nhất (danh sách OWASP hiện tại là [ở đây](https://owasp.org/www-project-top-ten/)) và giải quyết các lỗ hổng phổ biến nhất trước.
- Sử dụng [các công cụ quét lỗ hổng](https://owasp.org/www-community/Vulnerability_Scanning_Tools) để thực hiện kiểm tra bảo mật tự động trên trang web của bạn. Sau này, trang web rất thành công của bạn cũng có thể tìm thấy lỗi bằng cách cung cấp chương trình bug bounty [như Mozilla làm ở đây](https://www.mozilla.org/en-US/security/bug-bounty/faq-webapp/).
- Chỉ lưu trữ và hiển thị dữ liệu bạn cần. Ví dụ, nếu người dùng của bạn phải lưu trữ thông tin nhạy cảm như thông tin thẻ tín dụng, chỉ hiển thị đủ số thẻ để người dùng có thể nhận ra nó, và không đủ để kẻ tấn công có thể sao chép và sử dụng trên trang web khác. Mẫu phổ biến nhất hiện nay là chỉ hiển thị 4 chữ số cuối của số thẻ tín dụng.
- Giữ phần mềm cập nhật.
  Hầu hết máy chủ có cập nhật bảo mật thường xuyên khắc phục hoặc giảm thiểu các lỗ hổng đã biết.
  Nếu có thể, hãy lên lịch cập nhật tự động thường xuyên, và lý tưởng nhất, hãy lên lịch cập nhật vào những thời điểm trang web của bạn có lượng truy cập thấp nhất.
  Tốt nhất là sao lưu dữ liệu của bạn trước khi cập nhật và kiểm tra các phiên bản phần mềm mới để đảm bảo không có vấn đề tương thích nào trên máy chủ của bạn.

Các framework web có thể giúp giảm thiểu nhiều lỗ hổng phổ biến hơn.

## Tóm tắt

Bài viết này đã giải thích khái niệm bảo mật web và một số mối đe dọa phổ biến hơn mà trang web của bạn nên cố gắng bảo vệ. Quan trọng nhất, bạn nên hiểu rằng ứng dụng web không thể tin tưởng bất kỳ dữ liệu nào từ trình duyệt web. Tất cả dữ liệu người dùng nên được làm sạch trước khi nó được hiển thị, hoặc được sử dụng trong các truy vấn SQL và các cuộc gọi hệ thống tệp.

Với bài viết này, bạn đã đến cuối [mô-đun này](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps), bao gồm các bước đầu tiên của bạn trong lập trình trang web phía máy chủ. Chúng tôi hy vọng bạn đã thích học các khái niệm cơ bản này, và bây giờ bạn đã sẵn sàng chọn Framework Web và bắt đầu lập trình.

{{PreviousMenu("Learn_web_development/Extensions/Server-side/First_steps/Web_frameworks", "Learn_web_development/Extensions/Server-side/First_steps")}}
