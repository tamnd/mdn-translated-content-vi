---
title: EyeDropper API
slug: Web/API/EyeDropper_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.EyeDropper
---

{{securecontext_header}}{{DefaultAPISidebar("EyeDropper API")}}{{SeeCompatTable}}

**EyeDropper API** cung cấp một cơ chế để tạo công cụ ống hút màu. Với công cụ này, người dùng có thể lấy mẫu màu từ màn hình của họ, kể cả bên ngoài cửa sổ trình duyệt.

## Khái niệm

Các ứng dụng sáng tạo thường cho phép người dùng lấy mẫu màu từ bản vẽ hoặc hình khối trong ứng dụng để tái sử dụng. Ứng dụng web có thể dùng **EyeDropper API** để cung cấp một chế độ ống hút màu tương tự, được trình duyệt hỗ trợ.

Khi dùng API này, ứng dụng web có thể khởi động chế độ ống hút màu. Sau khi được khởi động, con trỏ sẽ thay đổi để cho người dùng biết rằng chế độ này đang hoạt động. Người dùng sau đó có thể chọn một màu ở bất kỳ đâu trên màn hình hoặc thoát khỏi chế độ ống hút màu bằng cách nhấn <kbd>Escape</kbd>.

## Biện pháp bảo mật và quyền riêng tư

Để ngăn các trang web độc hại lấy dữ liệu pixel từ màn hình của người dùng mà họ không nhận ra, **EyeDropper API** triển khai các biện pháp sau:

- API không cho phép chế độ ống hút màu bắt đầu nếu không có ý định từ người dùng. Phương thức {{domxref("EyeDropper.open()")}} chỉ có thể được gọi khi phản hồi một thao tác của người dùng, chẳng hạn như nhấp vào nút.
- Không thể truy xuất thông tin pixel nếu không có ý định từ người dùng. Promise do {{domxref("EyeDropper.open()")}} trả về chỉ được giải quyết thành giá trị màu khi phản hồi một thao tác của người dùng (nhấp vào một pixel). Vì vậy, không thể dùng ống hút màu chạy nền mà người dùng không nhận ra.
- Để giúp người dùng dễ nhận ra chế độ ống hút màu hơn, các trình duyệt làm cho nó trở nên rõ ràng. Con trỏ chuột bình thường sẽ biến mất sau một khoảng trễ ngắn và thay vào đó là một kính lúp. Cũng có một khoảng trễ giữa lúc chế độ ống hút màu bắt đầu và lúc người dùng có thể chọn pixel, nhằm đảm bảo người dùng đã có thời gian nhìn thấy kính lúp.
- Người dùng cũng có thể hủy chế độ ống hút màu bất kỳ lúc nào, bằng cách nhấn phím <kbd>Escape</kbd>.

## Giao diện

- {{DOMxRef("EyeDropper")}} {{Experimental_Inline}}
  - : Giao diện **`EyeDropper`** đại diện cho một thể hiện của công cụ ống hút màu, có thể được mở và dùng để người dùng chọn màu từ màn hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Picking colors of any pixel on the screen with the EyeDropper API](https://developer.chrome.com/docs/capabilities/web-apis/eyedropper)
- [The EyeDropper API W3C/SMPTE Joint Workshop](https://www.w3.org/2021/03/media-production-workshop/talks/patrick-brosset-eyedropper-api.html)
