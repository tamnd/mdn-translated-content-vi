---
title: Cookie bên thứ ba
slug: Web/Privacy/Guides/Third-party_cookies
page-type: guide
sidebar: privacy
---

Bài viết này giải thích cookie bên thứ ba là gì, mô tả các vấn đề liên quan đến chúng, và giải thích cách bạn có thể làm việc quanh các vấn đề đó.

## Cookie bên thứ ba là gì?

Một [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) được gắn với một domain và scheme cụ thể (thường là `https`), và cũng có thể được gắn với các subdomain nếu thuộc tính `Domain` của {{HTTPHeader("Set-Cookie")}} được đặt.

- Nếu domain và scheme của cookie khớp với trang hiện tại mà người dùng đang xem (URL hiển thị trên thanh địa chỉ của trình duyệt), cookie đó được xem là đến từ cùng site với trang và được gọi là _cookie bên thứ nhất_.
- Nếu domain và scheme khác nhau, cookie không được xem là đến từ cùng site, và được gọi là _cookie bên thứ ba_.

> [!NOTE]
> Cookie bên thứ ba đôi khi còn được gọi là _cookie liên trang_. Đây có thể là tên chính xác hơn, vì _cookie bên thứ ba_ gợi ý quyền sở hữu bởi một công ty hoặc tổ chức bên thứ ba. Tuy nhiên, hành vi và các vấn đề tiềm ẩn là như nhau dù bạn có sở hữu tất cả các site liên quan hay không. Ví dụ, một site có thể truy cập tài nguyên như hình ảnh từ một domain khác mà họ sở hữu.

Cookie bên thứ nhất có thể được đặt khi người dùng lần đầu truy cập một trang, đi theo một liên kết nội bộ tới trang khác trong cùng site, hoặc yêu cầu một tài nguyên nằm trên cùng site (ví dụ, ảnh nhúng, web font, hoặc tệp JavaScript).

Cookie bên thứ ba được gửi trong các tình huống phổ biến sau:

- Khi một liên kết được nhấp trên một site để điều hướng tới site khác.
- Khi một trang nhúng các thành phần từ site khác, chẳng hạn hình ảnh hoặc tài liệu khác được nhúng trong {{htmlelement("iframe")}} (thường được gọi là _nội dung bên thứ ba_). Bên cạnh yêu cầu ban đầu cho thành phần đó, các thành phần này có thể tạo ra thêm các yêu cầu khác thiết lập thêm cookie bên thứ ba.

## Cookie bên thứ ba được dùng để làm gì?

Cookie bên thứ ba được đặt khi nhấp vào các liên kết tới site khác được dùng cho nhiều mục đích khác nhau. Ví dụ, bạn có thể có một liên kết liên kết tiếp thị tới site đối tác và đặt cookie khi người dùng đi theo liên kết đó để một banner thưởng có thể được hiển thị với giảm giá nếu một sản phẩm nhất định được mua, hoặc để trả hoa hồng cho bên giới thiệu.

Nội dung bên thứ ba đặt cookie cũng có rất nhiều công dụng khác nhau. Ví dụ, bạn có thể có một widget đăng nhập được nhúng trên nhiều site khác nhau nhưng có liên quan, chia sẻ một cookie trên tất cả các site để xác nhận rằng người dùng đã đăng nhập, nhờ đó họ không phải đăng nhập lại trên từng site.

Các trường hợp dùng khác của cookie bên thứ ba bao gồm:

- Chia sẻ thông tin tùy chọn hoặc giao diện trên nhiều site.
- Thu thập phân tích trên nhiều site.
- Đếm số lần hiển thị quảng cáo và ghi nhận sở thích người dùng để giúp các nền tảng quảng cáo hiển thị quảng cáo phù hợp hơn.

Hãy tiếp tục minh họa ví dụ widget đăng nhập đã nhắc ở trên với một công ty hư cấu, có các domain riêng cho cửa hàng trực tuyến (`shop.site`), diễn đàn thảo luận cộng đồng (`forum.site`), và dịch vụ khách hàng và trả hàng (`service.site`).

Ba site này đều có một widget đăng nhập được nhúng, được lưu trữ tại `auth.site`, để duy trì trạng thái đăng nhập trên các site. Người dùng có thể đăng nhập vào bất kỳ site nào trong số đó, tạo ra một cookie trên trình duyệt cho `auth.site` chứa session ID. Khi người dùng đi tới một trong các site khác, thể hiện `auth.site` được nhúng sẽ có quyền truy cập vào cookie session ID được đặt khi người dùng đăng nhập trên site đầu tiên. Nó có thể gửi cookie đó tới máy chủ, kiểm tra xem nó còn hợp lệ không, và đăng nhập vào site đó ngay lập tức.

![biểu diễn trực quan của mô tả hệ thống đăng nhập bên thứ ba ở trên](https://mdn.github.io/shared-assets/images/diagrams/http/cookies/3pc-example.png)

## Vấn đề với cookie bên thứ ba là gì?

Các trường hợp sử dụng ở trên nghe có vẻ vô hại. Tuy nhiên, cookie bên thứ ba cũng có thể được dùng cho các mục đích trái phép mà không có sự đồng ý của người dùng, và về mặt kỹ thuật thì không thể phân biệt với các trường hợp sử dụng hợp lệ.

Theo một liên kết tới bên thứ ba, hoặc tương tác với nội dung bên thứ ba được nhúng trong `<iframe>` (ví dụ, điền biểu mẫu hoặc nhấp nút), có thể dẫn tới việc cookie được đặt khiến thông tin của người dùng rơi vào tay người mà họ không ngờ tới. Thông tin này có thể được dùng để:

- Bám theo người dùng trên web bằng quảng cáo nhắm mục tiêu mỗi khi họ tìm kiếm thông tin về một sản phẩm cụ thể.
- Nhắm mục tiêu người dùng bằng email rác hoặc cuộc gọi điện thoại.
- Thao túng hành vi của họ để chọn một số tùy chọn nhất định làm tăng doanh thu tiếp thị liên kết hoặc thao túng số liệu thống kê.

Riêng lẻ, các trường hợp như vậy đã đủ tệ, nhưng còn tệ hơn nữa. Các máy chủ bên thứ ba có thể kết hợp thông tin từ nhiều cookie bên thứ ba được đặt trên các site khác nhau nơi nội dung bên thứ ba được nhúng để tạo ra một hồ sơ chi tiết về lịch sử duyệt web, sở thích, thói quen, và thông tin cá nhân của người dùng. Điều này có thể được dùng để tạo ra trải nghiệm người dùng xâm phạm, gây khó chịu, lừa đảo người dùng, hoặc thậm chí đánh cắp danh tính.

Trong những trường hợp như vậy, cookie bên thứ ba được gọi là _cookie theo dõi_.

> [!NOTE]
> Thông tin người dùng có được bằng các cách trái phép cũng thường bị bán cho các bên thứ ba khác, làm vấn đề trở nên nghiêm trọng hơn.

Các đạo luật như [General Data Privacy Regulation](https://gdpr.eu/) (GDPR) ở Liên minh châu Âu và [California Consumer Privacy Act](https://www.oag.ca.gov/privacy/ccpa) (CCPA) đã giúp ích bằng cách biến việc các công ty phải minh bạch về cookie họ đặt và thông tin họ thu thập thành yêu cầu pháp lý. Ví dụ gồm việc yêu cầu khách hàng đồng ý tham gia vào việc thu thập dữ liệu đó, cho phép họ xem công ty đang giữ dữ liệu gì về họ, và xóa dữ liệu nếu họ muốn. Tuy nhiên, vẫn không phải lúc nào khách hàng cũng hiểu rõ dữ liệu của họ được dùng như thế nào.

## Trình duyệt xử lý cookie bên thứ ba như thế nào?

Các nhà cung cấp trình duyệt biết rằng người dùng không thích hành vi được mô tả ở trên. Để giảm bớt tác động tiêu cực lên trải nghiệm người dùng, một số trình duyệt đã bắt đầu chặn cookie bên thứ ba theo mặc định, và các cơ chế thay thế đã được triển khai để phát triển các trường hợp sử dụng cookie bên thứ ba hợp pháp (xem [Transitioning from third-party cookies](#transitioning_from_third-party_cookies)).

Danh sách sau mô tả trạng thái chặn cookie bên thứ ba trên một số trình duyệt:

- Firefox bật [Total Cookie Protection](https://blog.mozilla.org/en/mozilla/firefox-rolls-out-total-cookie-protection-by-default-to-all-users-worldwide/) nếu [Enhanced Tracking Protection](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop) được bật, và điều này vốn là mặc định. Điều này cho cookie bên thứ ba một kho cookie riêng cho từng site, ngăn theo dõi liên trang.
- Safari có [Tracking prevention policy](https://webkit.org/tracking-prevention-policy/) tạo ra một tập hợp tương tự các bảo vệ cookie bên thứ ba được bật theo mặc định; xem [Intelligent Tracking Prevention](https://webkit.org/tracking-prevention/#intelligent-tracking-prevention-itp) (ITP) để biết chi tiết.
- Google Chrome không chặn cookie bên thứ ba theo mặc định, chỉ trong chế độ Incognito, hoặc khi người dùng tự đặt chặn cookie bên thứ ba thông qua `chrome://settings`.
- Edge chặn tracker từ các site chưa truy cập, và chặn tracker có hại đã biết theo mặc định. Xem [Tracking prevention](https://learn.microsoft.com/en-us/microsoft-edge/web-platform/tracking-prevention) để biết thêm.
- [Brave browser](https://brave.com/) chặn cookie theo dõi theo mặc định.

Trong Firefox, Chrome và Edge, có thể cho phép sử dụng cookie bên thứ ba theo từng trường hợp thông qua cài đặt trình duyệt. Tuy nhiên, trong Safari thì quyền kiểm soát hạn chế hơn - bạn có thể tắt ngăn chặn theo dõi liên trang, nhưng việc cho phép truy cập cookie bên thứ ba theo từng frame chỉ có thể thực hiện ở mức mã, thông qua [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

> [!NOTE]
> Cookie bên thứ ba (hoặc chỉ cookie theo dõi) cũng có thể bị chặn bởi tiện ích mở rộng trình duyệt.

Việc chặn cookie có thể làm cho chức năng website và các thành phần bên thứ ba (chẳng hạn widget mạng xã hội) không hoạt động như dự định. Kết quả là, các trình duyệt bao gồm các ngoại lệ và heuristic trong mã nguồn để xử lý các vấn đề cookie bên thứ ba tồn tại lâu dài trên các website phổ biến.

Nhìn chung, nhà phát triển nên bắt đầu tìm cách hạn chế các hoàn cảnh mà cookie bên thứ ba được gửi để giảm khả năng gây hại cho quyền riêng tư, và giảm sự phụ thuộc vào chúng.

## Hạn chế cookie bên thứ ba bằng `SameSite`

Thuộc tính [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) cho phép máy chủ chỉ định liệu cookie bên thứ ba có được gửi hay không và khi nào. Nếu bạn không chỉ định `SameSite` trong tiêu đề `Set-Cookie`, giá trị mặc định sẽ được dùng, là `Lax` trong các trình duyệt dựa trên Chromium và thay đổi ở các trình duyệt khác. Vì vậy, bạn nên đặt `SameSite` một cách rõ ràng để bảo đảm hành vi nhất quán.

Bạn nên cố gắng dùng `Lax` làm mặc định hợp lý trong ứng dụng của mình khi có thể. Điều này hướng dẫn trình duyệt không gửi cookie bên thứ ba trừ khi người dùng điều hướng tới site gốc của cookie từ một site khác. Điều này hữu ích khi bạn muốn gửi cookie ngay khi người dùng điều hướng tới site của bạn từ một site khác, ví dụ để cá nhân hóa trải nghiệm ngay khi họ đến.

Tuy nhiên, cách này không phù hợp nếu bạn muốn nhúng nội dung liên trang trên nhiều site bên trong `<iframe>` và dựa vào cookie bên thứ ba cho chức năng, ví dụ trong trường hợp ví dụ đăng nhập mà chúng ta vừa xem ở trên. Trong những trường hợp như vậy, bạn cần đặt rõ `SameSite=None` để cho phép trình duyệt truyền những cookie đó:

```http
Set-Cookie: widget_session=7yjgj57e4n3d; SameSite=None; Secure; HttpOnly
```

Lưu ý rằng nếu `SameSite=None` được đặt thì thuộc tính `Secure` cũng phải được đặt - `SameSite=None` yêu cầu một _secure context_. Trong ví dụ trên, chúng ta cũng đã đặt thuộc tính `HttpOnly`, để vô hiệu hóa quyền truy cập JavaScript vào cookie (ví dụ, thông qua {{domxref("Document.cookie")}}). Cookie chứa thông tin nhạy cảm nên luôn phải đặt thuộc tính `HttpOnly` - việc để chúng có thể truy cập bởi JavaScript là rất không an toàn. Biện pháp phòng ngừa này giúp giảm thiểu các cuộc tấn công cross-site scripting ([XSS](/en-US/docs/Web/Security/Attacks/XSS)).

> [!NOTE]
> Cookie dùng cho thông tin nhạy cảm cũng nên có một [thời gian tồn tại](/en-US/docs/Web/HTTP/Guides/Cookies#removal_defining_the_lifetime_of_a_cookie) ngắn.

> [!NOTE]
> Bạn có thể đặt giá trị thuộc tính `SameSite` là `Strict` cho cookie nếu bạn chỉ muốn chúng được gửi cùng các yêu cầu xuất phát từ cùng site đã đặt cookie. Điều này thực tế chặn cookie bên thứ ba được gửi trong mọi trường hợp.

## Chuyển đổi khỏi cookie bên thứ ba

Có nhiều chiến lược để giúp site giảm thiểu hỏng hóc trong các trình duyệt mà cookie bên thứ ba bị chặn:

1. Kiểm kê việc bạn dùng cookie bên thứ ba. Cookie phải có thuộc tính `SameSite=None` mới có thể được dùng trong ngữ cảnh liên trang. Vì vậy, bạn có thể xác định cookie bên thứ ba bằng cách tìm `SameSite=None` trong mã của mình, hoặc kiểm tra các cookie `SameSite=None` đã được lưu trong DevTools của trình duyệt, ví dụ trong [Firefox Storage Inspector](https://firefox-source-docs.mozilla.org/devtools-user/storage_inspector/). [Issues panel](https://developer.chrome.com/docs/devtools/issues/) của Chrome cũng [báo cáo các vấn đề với việc chặn cookie bên thứ ba](https://privacysandbox.google.com/cookies/prepare/audit-cookies#chrome-dev-tools) cùng với danh sách các cookie bị ảnh hưởng.
2. Kiểm thử chức năng của bạn khi cookie bên thứ ba bị chặn, để xem điều gì bị hỏng. Bạn có thể thấy rằng một số cookie không còn cần thiết nữa.
3. Ít nhất ở giai đoạn đầu, bạn có thể làm cho mã của mình bền bỉ hơn để nó cung cấp trải nghiệm ít cá nhân hóa hơn khi dữ liệu cookie bên thứ ba không có sẵn thay vì làm hỏng hoàn toàn. Hãy theo các nguyên tắc của [graceful degradation](/en-US/docs/Glossary/Graceful_degradation).
4. Thu thập dữ liệu bằng các cách thay thế như khảo sát người dùng hoặc câu hỏi kiểm tra, hoặc xem dữ liệu bạn đã có để suy ra xu hướng (ví dụ, lịch sử đặt hàng sản phẩm).
5. Dùng cơ chế lưu trữ phía máy khách thay thế như [Web Storage](/en-US/docs/Web/API/Web_Storage_API) để lưu dữ liệu, hoặc cân nhắc giải pháp phía máy chủ.
6. Nếu cookie bên thứ ba của bạn chỉ được dùng trên một số ít website liên quan, đã biết, bạn có thể dùng [Storage Access API](/en-US/docs/Web/API/Storage_Access_API) để chỉ cho phép truy cập cookie liên trang cho những site cụ thể đó. Storage Access sẽ nhắc người dùng cấp quyền cho site dùng cookie bên thứ ba theo từng frame.
7. Nếu cookie bên thứ ba của bạn được dùng theo quan hệ 1:1 với các site cấp cao nhất mà chúng được tạo trên đó, bạn có thể dùng [Cookies Having Independent Partitioned State](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) (CHIPS, còn gọi là cookie phân vùng opt-in) để đưa cookie của bạn vào lưu trữ phân vùng với một kho cookie riêng cho từng site cấp cao nhất. Điều này chỉ cần thêm thuộc tính `partitioned` vào các cookie liên trang hiện có của bạn. Sau đó chúng có thể được dùng không bị giới hạn, nhưng không thể chia sẻ với các site khác.

## Xem thêm

- [HTTP cookies](/en-US/docs/Web/HTTP/Guides/Cookies)
- [Privacy on the web](/en-US/docs/Web/Privacy)
