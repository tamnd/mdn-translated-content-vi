---
title: API Geolocation
slug: Web/API/Geolocation_API
page-type: web-api-overview
browser-compat: api.Geolocation
---

{{securecontext_header}}{{DefaultAPISidebar("Geolocation API")}}

**Geolocation API** cho phép người dùng cung cấp vị trí của họ cho các ứng dụng web nếu họ muốn. Vì lý do riêng tư, người dùng sẽ được hỏi quyền trước khi thông tin vị trí được báo cáo.

Những WebExtension muốn dùng đối tượng `Geolocation` phải thêm quyền `"geolocation"` vào `manifest` của chúng. Hệ điều hành của người dùng sẽ nhắc cho phép truy cập vị trí vào lần đầu tiên tính năng này được yêu cầu.

> [!NOTE]
> Phần tử {{htmlelement("geolocation")}} cung cấp một cơ chế thay thế để truy cập và xử lý dữ liệu định vị, giải quyết một số hạn chế của Geolocation API: giao diện người dùng nhất quán hơn và quy trình quản lý quyền trực quan hơn.

## Khái niệm và cách sử dụng

Bạn thường sẽ muốn lấy thông tin vị trí của người dùng trong ứng dụng web của mình, chẳng hạn để hiển thị vị trí của họ trên bản đồ hoặc hiển thị thông tin cá nhân hóa phù hợp với vị trí đó.

Geolocation API được truy cập thông qua lời gọi {{domxref("Navigator.geolocation", "navigator.geolocation")}}; thao tác này sẽ khiến trình duyệt của người dùng hỏi họ có cho phép truy cập dữ liệu vị trí hay không. Nếu họ chấp nhận, trình duyệt sẽ dùng chức năng tốt nhất có sẵn trên thiết bị để truy cập thông tin này (ví dụ: GPS).

Nhà phát triển có thể truy cập thông tin vị trí theo một vài cách khác nhau:

- {{domxref("Geolocation.getCurrentPosition()")}}: Lấy vị trí hiện tại của thiết bị.
- {{domxref("Geolocation.watchPosition()")}}: Đăng ký một hàm xử lý sẽ được gọi tự động mỗi khi vị trí của thiết bị thay đổi, và trả về vị trí đã cập nhật.

Trong cả hai trường hợp, lời gọi phương thức nhận tối đa ba đối số:

- Một callback thành công bắt buộc: Nếu lấy vị trí thành công, callback sẽ được thực thi với một đối tượng {{domxref("GeolocationPosition")}} là đối số duy nhất, cung cấp quyền truy cập vào dữ liệu vị trí.
- Một callback lỗi tùy chọn: Nếu lấy vị trí không thành công, callback sẽ được thực thi với một đối tượng {{domxref("GeolocationPositionError")}} là đối số duy nhất, cung cấp thông tin về lỗi đã xảy ra.
- Một đối tượng tùy chọn cung cấp các tùy chọn để lấy dữ liệu vị trí.

Để biết thêm thông tin về cách dùng Geolocation, hãy đọc [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API).

## Các giao diện

- {{domxref("Geolocation")}}
  - : Lớp chính của API này - chứa các phương thức để lấy vị trí hiện tại của người dùng, theo dõi thay đổi vị trí và xóa một lượt theo dõi đã đặt trước đó.
- {{domxref("GeolocationPosition")}}
  - : Đại diện cho vị trí của người dùng. Một thể hiện `GeolocationPosition` được trả về khi gọi thành công một trong các phương thức bên trong {{domxref("Geolocation")}}, trong callback thành công, và chứa một dấu thời gian cùng một thể hiện đối tượng {{domxref("GeolocationCoordinates")}}.
- {{domxref("GeolocationCoordinates")}}
  - : Đại diện cho tọa độ vị trí của người dùng; một thể hiện `GeolocationCoordinates` chứa vĩ độ, kinh độ và các thông tin liên quan quan trọng khác.
- {{domxref("GeolocationPositionError")}}
  - : Một `GeolocationPositionError` được trả về khi gọi không thành công một trong các phương thức bên trong {{domxref("Geolocation")}}, trong callback lỗi, và chứa mã lỗi cùng thông báo lỗi.

### Phần mở rộng cho các giao diện khác

- {{domxref("Navigator.geolocation")}}
  - : Điểm vào của API. Trả về một thể hiện đối tượng {{domxref("Geolocation")}}, từ đó có thể truy cập mọi chức năng còn lại.

## Cân nhắc về bảo mật

Geolocation API cho phép người dùng truy cập lập trình vào thông tin vị trí trong [ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Việc truy cập có thể còn bị kiểm soát bởi chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/geolocation","geolocation")}}.
Danh sách cho phép mặc định cho `geolocation` là `self`, nghĩa là chỉ các iframe lồng nhau cùng nguồn gốc mới được phép truy cập thông tin vị trí.
Việc dùng từ bên thứ ba được bật bằng cách đặt header phản hồi `Permissions-Policy` để cấp quyền cho một nguồn gốc bên thứ ba cụ thể:

```http
Permissions-Policy: geolocation=(self b.example.com)
```

Sau đó, thuộc tính `allow="geolocation"` phải được thêm vào phần tử iframe có nguồn từ nguồn gốc đó:

```html
<iframe src="https://b.example.com" allow="geolocation"></iframe>
```

Dữ liệu định vị có thể tiết lộ thông tin mà chủ sở hữu thiết bị không muốn chia sẻ.
Vì vậy, người dùng phải cấp quyền rõ ràng thông qua một lời nhắc khi {{domxref("Geolocation.getCurrentPosition()")}} hoặc {{domxref("Geolocation.watchPosition()")}} được gọi (trừ khi trạng thái quyền đã là `granted` hoặc `denied`).
Thời hạn của quyền đã cấp phụ thuộc vào user agent, và có thể dựa trên thời gian, theo phiên, hoặc thậm chí là vĩnh viễn.
Quyền `geolocation` của [Permissions API](/en-US/docs/Web/API/Permissions_API) có thể được dùng để kiểm tra xem quyền truy cập thông tin vị trí đang là `granted`, `denied` hay `prompt` (cần người dùng xác nhận lời nhắc).

## Ví dụ

Xem [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Tính khả dụng

Vì việc xác định vị trí dựa trên Wi-Fi thường được cung cấp bởi Google, Geolocation API gốc có thể không khả dụng ở Trung Quốc. Bạn có thể dùng các nhà cung cấp bên thứ ba nội địa như [Baidu](https://lbsyun.baidu.com/index.php?title=jspopular/guide/geolocation), [Autonavi](https://lbs.amap.com/api/javascript-api/guide/services/geolocation#geolocation) hoặc [Tencent](https://lbs.qq.com/service/webService/webServiceGuide/position/webServiceIp). Các dịch vụ này dùng địa chỉ IP của người dùng và/hoặc một ứng dụng cục bộ để cung cấp định vị nâng cao.

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- [Who moved my geolocation?](https://hacks.mozilla.org/2013/10/who-moved-my-geolocation/) (Hacks blog)
