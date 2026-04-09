---
title: Attribution Reporting API
slug: Web/API/Attribution_Reporting_API
page-type: web-api-overview
status:
  - deprecated
browser-compat: html.elements.a.attributionsrc
---

{{securecontext_header}}{{DefaultAPISidebar("Attribution Reporting API")}}{{deprecated_header}}

**Attribution Reporting API** cho phép nhà phát triển đo lường lượt chuyển đổi, ví dụ khi người dùng nhấp vào một quảng cáo được nhúng trên một trang rồi tiếp tục mua sản phẩm đó trên trang của nhà cung cấp, và sau đó truy cập các báo cáo về những lượt chuyển đổi đó. API này thực hiện việc đó mà không phụ thuộc vào cookie theo dõi của bên thứ ba.

## Khái niệm và cách dùng

Các nhà quảng cáo thường muốn đo số người dùng nhìn thấy quảng cáo rồi tiếp tục xem và mua một sản phẩm (lượt chuyển đổi). Điều này cho phép họ xác định vị trí đặt quảng cáo nào mang lại tỷ suất hoàn vốn (ROI) cao nhất để điều chỉnh chiến lược quảng cáo cho phù hợp. Quá trình đo lường chuyển đổi thường bao gồm việc thu thập dữ liệu như:

- Những người dùng nào đã chuyển đổi (ví dụ mua sản phẩm hoặc đăng ký dịch vụ), và có bao nhiêu người.
- Khu vực địa lý của họ.
- Quảng cáo được đặt trên những trang nào.
- Đã bán được bao nhiêu sản phẩm, có bao nhiêu lượt đăng ký dịch vụ, v.v.
- Doanh thu tạo ra là bao nhiêu.

Theo cách truyền thống trên web, lượt chuyển đổi được đo bằng cookie theo dõi của bên thứ ba. Quảng cáo thường được nhúng vào trang web trong một {{htmlelement("iframe")}}, và khung này có thể đặt một cookie chứa thông tin về người dùng và tương tác của họ với quảng cáo.

Về sau, khi người dùng quyết định truy cập trang của nhà quảng cáo, miễn là trang đó thuộc cùng tên miền với quảng cáo, trang này có thể truy cập cookie bên thứ ba mà quảng cáo đã đặt trước đó. Nhà quảng cáo sau đó có thể liên kết dữ liệu từ quảng cáo với dữ liệu bên thứ nhất của riêng họ để trả lời các câu hỏi như "người dùng có mua sản phẩm sau khi tương tác với quảng cáo về sản phẩm đó từ một trang khác không?"

Điều này gây bất lợi cho [quyền riêng tư](/en-US/docs/Web/Privacy) của người dùng. Tại thời điểm này, bất kỳ trang nào từ cùng một miền đều có thể truy cập cookie đó, cộng với thông tin từ các trang nhúng những trang đó. Số lượng bên có thể truy cập dữ liệu đó lớn đến bất ngờ, và họ có thể suy ra thêm dữ liệu khác về người dùng dựa trên thói quen duyệt web của họ.

Attribution Reporting API cung cấp một cách đo lường lượt chuyển đổi quảng cáo mà vẫn bảo vệ quyền riêng tư của người dùng.

### Cơ chế hoạt động

Hãy minh họa cách Attribution Reporting API hoạt động bằng một ví dụ.

Giả sử chúng ta có một cửa hàng trực tuyến, `shop.example` (còn gọi là nhà quảng cáo), nhúng quảng cáo cho một trong các sản phẩm của mình trên một trang nội dung, `news.example` (còn gọi là nhà xuất bản). Nội dung quảng cáo nằm tại `ad.shop.example`.

Chủ cửa hàng trực tuyến muốn đo xem họ nhận được bao nhiêu lượt chuyển đổi từ những người dùng tương tác với quảng cáo, xem trang sản phẩm trên trang của họ, và đưa sản phẩm vào giỏ hàng.

![Hình minh họa các bước được mô tả bên dưới](/shared-assets/images/diagrams/api/attribution-reporting/ara-flow.svg)

Các bước liên quan như sau:

1. Khi người dùng truy cập trang `news.example`, có thể đăng ký một **attribution source** cho các tương tác cụ thể của người dùng với quảng cáo được nhúng. Có một số cách người dùng có thể tương tác với quảng cáo trên trang. Để một tương tác quảng cáo đăng ký attribution source, quảng cáo phải gửi một yêu cầu có kèm header {{httpheader("Attribution-Reporting-Eligible")}} để chỉ ra rằng phản hồi đủ điều kiện đăng ký attribution source. Việc đăng ký sẽ hoàn tất nếu phản hồi bao gồm header {{httpheader("Attribution-Reporting-Register-Source")}} phù hợp. Attribution source có thể là, ví dụ:
   - Một liên kết. Trong trường hợp này, tương tác là người dùng nhấp vào liên kết đó (trực tiếp qua phần tử {{htmlelement("a")}} hoặc qua lời gọi {{domxref("Window.open()")}}). Source được đăng ký qua phản hồi đối với yêu cầu điều hướng.
   - Một hình ảnh như banner quảng cáo hoặc pixel theo dõi trong suốt 1x1. Trong trường hợp này, tương tác là người dùng truy cập trang. Source được đăng ký khi hình ảnh tải xong, tức là khi máy chủ phản hồi yêu cầu ảnh.
   - Một yêu cầu fetch (tức {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}}). Trong trường hợp này, tương tác có thể được xác định là bất cứ điều gì phù hợp với ứng dụng của bạn, ví dụ yêu cầu fetch có thể được gọi bởi sự kiện `click` hoặc `submit`. Source được đăng ký sau khi phản hồi quay về.
2. Khi tương tác với attribution source xảy ra, dữ liệu source được trả về trong header {{httpheader("Attribution-Reporting-Register-Source")}} sẽ được lưu trong một bộ nhớ đệm cục bộ riêng tư chỉ trình duyệt mới truy cập được. Dữ liệu này bao gồm dữ liệu ngữ cảnh và dữ liệu bên thứ nhất mà trang và nhà quảng cáo có thể truy cập, origin của công ty ad tech đang thu thập dữ liệu chuyển đổi, cùng với một hoặc nhiều đích đến ({{glossary("registrable domain", "registrable domains")}}) nơi bạn kỳ vọng lượt chuyển đổi từ quảng cáo đó sẽ xảy ra (tức trang của nhà quảng cáo, ví dụ `shop.example`).
3. Khi người dùng sau đó truy cập `shop.example`, trang này có thể đăng ký một **attribution trigger** khi một tương tác cho thấy đã xảy ra lượt chuyển đổi (ví dụ người dùng nhấp vào nút "Add to cart" trên `shop.example`). Trình duyệt sau đó sẽ gửi một yêu cầu cùng header {{httpheader("Attribution-Reporting-Eligible")}} để chỉ ra rằng phản hồi đủ điều kiện đăng ký attribution trigger, và việc đăng ký sẽ hoàn tất nếu phản hồi bao gồm header {{httpheader("Attribution-Reporting-Register-Trigger")}} phù hợp. Attribution trigger có thể là, ví dụ:
   - Một hình ảnh như biểu tượng giỏ hàng hoặc pixel theo dõi trong suốt 1x1. Trong trường hợp này, tương tác là người dùng truy cập trang. Trigger được đăng ký khi hình ảnh tải xong, tức là khi máy chủ phản hồi yêu cầu ảnh.
   - Một yêu cầu fetch (tức {{domxref("Window/fetch", "fetch()")}} hoặc {{domxref("XMLHttpRequest")}}). Trong trường hợp này, tương tác có thể được xác định là bất cứ điều gì phù hợp với ứng dụng của bạn, ví dụ yêu cầu fetch có thể được gọi bởi sự kiện `click` hoặc `submit`. Trigger được đăng ký sau khi phản hồi quay về.
4. Khi việc gán trigger hoàn tất, trình duyệt cố gắng đối sánh dữ liệu từ header [Attribution-Reporting-Register-Trigger](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger) với một mục dữ liệu source đã lưu trong bộ nhớ đệm cục bộ riêng tư (xem 2.). Xem [Đăng ký attribution trigger](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers) để biết phương pháp đối sánh và các yêu cầu.
5. Nếu có đối sánh, trình duyệt gửi dữ liệu báo cáo tới một endpoint trên máy chủ báo cáo thường do nhà cung cấp ad tech sở hữu để có thể phân tích an toàn. Không giống như cookie, dữ liệu chỉ khả dụng với chính trang cụ thể mà bạn gửi đến, sẽ không có dữ liệu bị chia sẻ sang nơi khác. Các báo cáo này có thể là:
   - **Báo cáo cấp sự kiện**: Báo cáo dựa trên một sự kiện attribution source, trong đó dữ liệu source chi tiết được liên kết với dữ liệu trigger ở mức thô. Ví dụ, một báo cáo có thể trông như "Click ID 200498 trên `ad.shop.example` dẫn đến một giao dịch mua trên `shop.example`", trong đó "Click ID 200498" là dữ liệu source chi tiết, và "purchase" là dữ liệu trigger ở mức thô. Dữ liệu source chi tiết có thể mã hóa dữ liệu bên thứ nhất hoặc dữ liệu ngữ cảnh từ trang source, còn dữ liệu trigger có thể mã hóa sự kiện từ trang trigger.
   - **Báo cáo tóm tắt**: Báo cáo chi tiết hơn, kết hợp dữ liệu từ nhiều lượt chuyển đổi ở cả phía source và trigger. Ví dụ "Campaign ID 774653 trên `news.example` đã dẫn tới 654 lượt bán widget trên `shop.example` từ người dùng ở Ý, với tổng doanh thu là $9540." Việc biên soạn báo cáo tóm tắt đòi hỏi sử dụng một dịch vụ tổng hợp (xem ví dụ [Google aggregation service](https://github.com/privacysandbox/aggregation-service)).

Để biết thêm thông tin về cách triển khai chức năng cần thiết cho các bước ở trên, xem:

1. [Đăng ký attribution source](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources)
2. [Đăng ký attribution trigger](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers)
3. [Tạo báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports)

## Giao diện

Attribution Reporting API không định nghĩa giao diện riêng biệt nào của chính nó.

### Phần mở rộng cho các giao diện khác

- {{domxref("HTMLAnchorElement.attributionSrc")}}, {{domxref("HTMLImageElement.attributionSrc")}}, {{domxref("HTMLScriptElement.attributionSrc")}}
  - : Thuộc tính `attributionSrc` cho phép bạn lấy và đặt thuộc tính `attributionsrc` trên các phần tử {{htmlelement("a")}}, {{htmlelement("img")}}, và {{htmlelement("script")}} bằng lập trình. Thuộc tính này phản chiếu giá trị của thuộc tính HTML tương ứng.
- {{domxref("Window/fetch", "fetch()")}} và hàm dựng {{domxref("Request.Request", "Request()")}}, tùy chọn `attributionReporting`
  - : Khi tạo một yêu cầu qua {{domxref("Window/fetch", "fetch()")}}, tùy chọn này cho biết bạn muốn phản hồi có thể đăng ký attribution source hoặc trigger.
- {{domxref("XMLHttpRequest.setAttributionReporting()")}}
  - : Khi tạo một yêu cầu qua {{domxref("XMLHttpRequest")}}, tùy chọn này cho biết bạn muốn phản hồi có thể đăng ký attribution source hoặc trigger.
- {{domxref("Window.open()")}}, từ khóa tính năng `attributionsrc`
  - : Khiến việc đăng ký attribution source được hoàn tất _và_ kích hoạt trình duyệt lưu dữ liệu source liên quan (như được cung cấp trong header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}}) khi phương thức `open()` hoàn tất. Lưu ý rằng các lời gọi `Window.open()` không thể được dùng để đăng ký attribution trigger.

## Phần tử HTML

- {{htmlelement("a")}}, {{htmlelement("img")}}, và {{htmlelement("script")}} — thuộc tính `attributionsrc`
  - : Chỉ định rằng bạn muốn trình duyệt gửi header {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu tài nguyên liên quan. Ở phía máy chủ, header này được dùng để kích hoạt việc gửi header {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi. Khi đăng ký attribution source, đây là bắt buộc; khi đăng ký attribution trigger, nó chỉ bắt buộc nếu bạn muốn chỉ định một máy chủ đăng ký riêng biệt với tài nguyên mà thuộc tính `src` đang trỏ tới. Lưu ý rằng các phần tử `<a>` không thể được dùng để đăng ký attribution trigger.

## HTTP header

- {{httpheader("Attribution-Reporting-Eligible")}}
  - : Header yêu cầu HTTP chỉ ra rằng phản hồi tương ứng đủ điều kiện để đăng ký attribution source hoặc trigger.
- {{httpheader("Attribution-Reporting-Register-Source")}}
  - : Header phản hồi HTTP dùng để đăng ký một tính năng của trang làm attribution source. Header này được bao gồm như một phần của phản hồi cho một yêu cầu có chứa header `Attribution-Reporting-Eligible`.
- {{httpheader("Attribution-Reporting-Register-Trigger")}}
  - : Header phản hồi HTTP dùng để đăng ký một tính năng của trang làm attribution trigger. Header này được bao gồm như một phần của phản hồi cho một yêu cầu có chứa header `Attribution-Reporting-Eligible`.
- {{httpheader("Permissions-Policy")}} chỉ thị {{httpheader('Permissions-Policy/attribution-reporting','attribution-reporting')}}
  - : Kiểm soát việc tài liệu hiện tại có được phép dùng attribution reporting hay không.

## Đăng ký tham gia và thử nghiệm cục bộ

Để dùng Attribution Reporting API trên các trang của bạn, bạn phải khai báo nó trong [quy trình đăng ký Privacy Sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment). Nếu không làm như vậy, luồng API sẽ bị chặn tại thời điểm phản hồi, nghĩa là các header phản hồi sẽ bị bỏ qua và source cùng trigger sẽ không được đăng ký.

Bạn vẫn có thể kiểm thử mã Attribution Reporting API của mình cục bộ mà không cần đăng ký. Để cho phép kiểm thử cục bộ, hãy bật cờ dành cho nhà phát triển Chrome sau:

`chrome://flags/#privacy-sandbox-enrollment-overrides`

## Ví dụ

Xem [Demo: Attribution Reporting API](https://arapi-home.web.app/) để có một ví dụ triển khai (xem cả [mã nguồn](https://github.com/GoogleChromeLabs/trust-safety-demo/tree/main/attribution-reporting)).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Công cụ kiểm tra Attribution Reporting Header](https://wicg.github.io/attribution-reporting-api/validate-headers)
- [Attribution reporting](https://privacysandbox.google.com/private-advertising/attribution-reporting/) trên privacysandbox.google.com (2023)
- [Enable conversion measurement](https://privacysandbox.google.com/private-advertising/attribution-reporting/enable-conversion-measurement) trên privacysandbox.google.com (2023)
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com (2023)
