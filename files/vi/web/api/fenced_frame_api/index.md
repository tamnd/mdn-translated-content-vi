---
title: Fenced Frame API
slug: Web/API/Fenced_frame_API
page-type: web-api-overview
status:
  - experimental
browser-compat: html.elements.fencedframe
---

{{SeeCompatTable}}{{DefaultAPISidebar("Fenced Frame API")}}

> [!WARNING]
> Tính năng này hiện đang bị phản đối bởi một nhà cung cấp trình duyệt.
> Xem phần [Vị trí tiêu chuẩn](#standards_positions) bên dưới để biết chi tiết.

**Fenced Frame API** cung cấp chức năng kiểm soát nội dung được nhúng trong các phần tử {{htmlelement("fencedframe")}}.

## Khái niệm và cách sử dụng

Một nguồn lớn gây ra các vấn đề về [quyền riêng tư](/en-US/docs/Web/Privacy) và [bảo mật](/en-US/docs/Web/Security) trên web là nội dung được nhúng trong các phần tử {{htmlelement("iframe")}}. Trong lịch sử, `<iframe>` đã được sử dụng để đặt cookie của bên thứ ba, có thể được sử dụng để chia sẻ thông tin và theo dõi người dùng trên các trang web. Ngoài ra, nội dung được nhúng trong `<iframe>` có thể giao tiếp với tài liệu nhúng (ví dụ sử dụng {{domxref("Window.postMessage()")}}).

Tài liệu nhúng cũng có thể sử dụng script để đọc nhiều dạng thông tin từ `<iframe>`, ví dụ bạn có thể nhận được dữ liệu theo dõi/lấy dấu vân tay đáng kể từ việc đọc URL nhúng từ thuộc tính `src`, đặc biệt nếu nó chứa [tham số URL](/en-US/docs/Web/URI/Reference/Query). `<iframe>` cũng có thể truy cập DOM của ngữ cảnh nhúng và ngược lại.

Hầu hết các trình duyệt hiện đại đang nghiên cứu các cơ chế phân vùng lưu trữ để dữ liệu cookie không còn có thể được sử dụng để theo dõi nữa.

Các phần tử `<fencedframe>` nhằm giải quyết một phần khác của vấn đề này. Chúng rất giống `<iframe>` về hình thức và chức năng, ngoại trừ:

- Thông tin không thể được chia sẻ giữa nội dung `<fencedframe>` và trang web nhúng của nó.
- `<fencedframe>` có thể truy cập dữ liệu liên trang web, nhưng chỉ trong một tập hợp các trường hợp được kiểm soát cụ thể bảo tồn quyền riêng tư người dùng.
- `<fencedframe>` không thể được thao tác tự do hoặc truy cập dữ liệu của nó qua script thông thường (ví dụ đọc hoặc đặt URL nguồn). Nội dung `<fencedframe>` chỉ có thể được nhúng qua [các API cụ thể](#use_cases).
- `<fencedframe>` không thể truy cập DOM của ngữ cảnh nhúng, ngữ cảnh nhúng cũng không thể truy cập DOM của `<fencedframe>`.

Để biết thêm thông tin về mô hình giao tiếp của fenced frame, hãy đọc hướng dẫn [giao tiếp với các frame nhúng](/en-US/docs/Web/API/Fenced_frame_API/Communication_with_embedded_frames).

### Trường hợp sử dụng

`<fencedframe>` được sử dụng bởi các API khác để nhúng các loại nội dung liên trang web khác nhau hoặc thu thập dữ liệu, thực hiện các trường hợp sử dụng khác nhau theo cách bảo tồn quyền riêng tư. Hầu hết các trường hợp trước đây dựa vào cookie của bên thứ ba hoặc các cơ chế khác gây hại cho quyền riêng tư.

- [Shared Storage API](https://privacysandbox.google.com/private-advertising/shared-storage) cung cấp quyền truy cập vào dữ liệu liên trang web không được phân vùng trong môi trường an toàn, tính toán và/hoặc hiển thị kết quả trong `<fencedframe>`. Ví dụ:
  - Các nhà quảng cáo có thể đo lường phạm vi tiếp cận của quảng cáo, hoặc phục vụ quảng cáo tiếp theo dựa trên những quảng cáo người dùng đã xem trên các trang web khác.
  - Các nhà phát triển có thể thực hiện thử nghiệm A/B, hiển thị các biến thể cho người dùng dựa trên nhóm họ được phân công.
  - Doanh nghiệp có thể tùy chỉnh trải nghiệm người dùng dựa trên những gì họ đã thấy trên các trang web khác.
- [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience) cho phép các nhà phát triển triển khai quảng cáo dựa trên nhóm quan tâm.
- [Private Aggregation API](https://privacysandbox.google.com/private-advertising/private-aggregation) có thể thu thập dữ liệu từ `<fencedframe>` và tạo báo cáo tổng hợp.

## `<fencedframe>` hoạt động như thế nào?

Như đã đề cập ở trên, bạn không kiểm soát nội dung được nhúng trong {{htmlelement("fencedframe")}} trực tiếp qua script thông thường.

Để đặt nội dung nào sẽ được hiển thị trong `<fencedframe>`, một API sử dụng (như [Protected Audience](https://privacysandbox.google.com/private-advertising/protected-audience) hoặc [Shared Storage](https://privacysandbox.google.com/private-advertising/shared-storage)) tạo ra đối tượng {{domxref("FencedFrameConfig")}}, sau đó được đặt qua JavaScript làm giá trị của thuộc tính {{domxref("HTMLFencedFrameElement.config")}} của `<fencedframe>`.

Ví dụ sau lấy `FencedFrameConfig` từ cuộc đấu giá quảng cáo của Protected Audience API, sau đó được sử dụng để hiển thị quảng cáo thắng trong `<fencedframe>`:

```js
const frameConfig = await navigator.runAdAuction({
  // … auction configuration
  resolveToConfig: true,
});

const frame = document.createElement("fencedframe");
frame.config = frameConfig;
```

`resolveToConfig: true` phải được truyền vào lệnh gọi `runAdAuction()` để lấy đối tượng `FencedFrameConfig`. Nếu `resolveToConfig` được đặt thành `false`, {{jsxref("Promise")}} kết quả sẽ giải quyết thành [URN](/en-US/docs/Web/URI/Reference/Schemes/urn) mờ (ví dụ `urn:uuid:c36973b5-e5d9-de59-e4c4-364f137b3c7a`) chỉ có thể được sử dụng trong `<iframe>`.

Dù bằng cách nào, trình duyệt lưu trữ URL chứa vị trí đích của nội dung cần nhúng, được ánh xạ tới URN mờ, hoặc thuộc tính `url` nội bộ của `FencedFrameConfig`. Giá trị URL không thể được đọc bởi JavaScript chạy trong ngữ cảnh nhúng.

> [!NOTE]
> Hỗ trợ được cung cấp cho các URN mờ trong `<iframe>` để dễ dàng di chuyển các triển khai hiện tại sang API [privacy sandbox](https://privacysandbox.google.com/). Hỗ trợ này dự kiến sẽ tạm thời và sẽ bị xóa trong tương lai khi việc áp dụng tăng lên.

> [!NOTE]
> `FencedFrameConfig` có phương thức {{domxref("FencedFrameConfig.setSharedStorageContext", "setSharedStorageContext()")}} được sử dụng để truyền dữ liệu từ tài liệu nhúng vào bộ nhớ chia sẻ của `<fencedframe>`. Xem [Shared Storage API](https://privacysandbox.google.com/private-advertising/shared-storage) để biết thêm chi tiết.

### Truy cập chức năng fenced frame trên đối tượng `Fence`

Bên trong các tài liệu được nhúng trong `<fencedframe>`, JavaScript có quyền truy cập vào thuộc tính {{domxref("Window.fence")}} trả về đối tượng {{domxref("Fence")}} cho tài liệu đó. Đối tượng này chứa một số hàm liên quan đến chức năng Fenced Frame API.
Ví dụ, {{domxref("Fence.reportEvent()")}} cung cấp cách kích hoạt việc gửi dữ liệu báo cáo qua [beacon](/en-US/docs/Web/API/Beacon_API) đến một hoặc nhiều URL được chỉ định.

### Chính sách quyền

Chỉ các tính năng cụ thể được thiết kế để sử dụng trong `<fencedframe>` mới có thể được kích hoạt qua chính sách quyền được đặt trên chúng; các tính năng được kiểm soát bởi chính sách khác không có sẵn trong ngữ cảnh này.

### Tiêu đề HTTP

Tiêu đề {{httpheader("Sec-Fetch-Dest")}} với giá trị `fencedframe` sẽ được đặt cho mọi yêu cầu được thực hiện từ bên trong `<fencedframe>`, bao gồm cả `<iframe>` con được nhúng trong `<fencedframe>`.

```http
Sec-Fetch-Dest: fencedframe
```

Máy chủ phải đặt tiêu đề phản hồi {{httpheader("Supports-Loading-Mode")}} với giá trị `fenced-frame` cho bất kỳ tài liệu nào được định tải vào `<fencedframe>`, hoặc `<iframe>` được nhúng trong `<fencedframe>`.

```http
Supports-Loading-Mode: fenced-frame
```

### Sự kiện `beforeunload` và `unload`

Các sự kiện [`beforeunload`](/en-US/docs/Web/API/Window/beforeunload_event) và [`unload`](/en-US/docs/Web/API/Window/unload_event) không kích hoạt trên fenced frame, vì chúng có thể rò rỉ thông tin dưới dạng dấu thời gian xóa trang.

## Giao diện

- {{domxref("FencedFrameConfig")}}
  - : Đại diện cho điều hướng của {{htmlelement("fencedframe")}}, tức là nội dung nào sẽ được hiển thị trong đó. `FencedFrameConfig` được trả về từ nguồn như [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience) và được đặt làm giá trị của {{domxref("HTMLFencedFrameElement.config")}}.
- {{domxref("Fence")}}
  - : Chứa một số hàm liên quan đến chức năng fenced frame. Chỉ có sẵn cho các tài liệu được nhúng bên trong `<fencedframe>`.
- {{domxref("HTMLFencedFrameElement")}}
  - : Đại diện cho phần tử `<fencedframe>` trong JavaScript và cung cấp các thuộc tính để cấu hình nó.

### Phần mở rộng cho các giao diện khác

- {{domxref("Navigator.deprecatedReplaceInURN()")}}
  - : Thay thế các chuỗi được chỉ định bên trong URL được ánh xạ tương ứng với URN mờ đã cho hoặc thuộc tính `url` nội bộ của `FencedFrameConfig`.
- {{domxref("Window.fence")}}
  - : Trả về đối tượng {{domxref("Fence")}} cho ngữ cảnh tài liệu hiện tại. Chỉ có sẵn cho các tài liệu được nhúng bên trong `<fencedframe>`.

## Đăng ký và kiểm thử cục bộ

Một số tính năng API tạo ra {{domxref("FencedFrameConfig")}} yêu cầu bạn đăng ký trang web của mình trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment). Nếu không làm điều này, các lệnh gọi API sẽ thất bại với cảnh báo bảng điều khiển.

> [!NOTE]
> Trong Chrome, bạn vẫn có thể kiểm thử mã fenced frame cục bộ mà không cần đăng ký. Để cho phép kiểm thử cục bộ, hãy bật cờ nhà phát triển Chrome sau:
>
> `chrome://flags/#privacy-sandbox-enrollment-overrides`

## Ví dụ

Các demo sau đây đều sử dụng `<fencedframe>`:

- [Demo Shared Storage API](https://shared-storage-demo.web.app/) (cũng bao gồm một số ví dụ Private Aggregation API)
- [Demo Protected Audience API](https://protected-audience-demo-advertiser.web.app/)

## Thông số kỹ thuật

{{Specifications}}

### Vị trí tiêu chuẩn

Một nhà cung cấp trình duyệt [phản đối](/en-US/docs/Glossary/Web_standards#opposing_standards) đặc tả này.
Các vị trí tiêu chuẩn đã biết như sau:

- Mozilla (Firefox): [Tiêu cực](https://github.com/mozilla/standards-positions/issues/781)

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
