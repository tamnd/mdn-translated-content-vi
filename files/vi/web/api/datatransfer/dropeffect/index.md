---
title: "DataTransfer: thuộc tính dropEffect"
short-title: dropEffect
slug: Web/API/DataTransfer/dropEffect
page-type: web-api-instance-property
browser-compat: api.DataTransfer.dropEffect
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính **`DataTransfer.dropEffect`** điều khiển phản hồi (thường là trực quan) được cung cấp cho người dùng trong thao tác kéo và thả. Nó ảnh hưởng đến con trỏ hiển thị trong khi kéo. Ví dụ, khi người dùng di chuột qua phần tử đích thả, con trỏ của trình duyệt có thể cho biết loại thao tác nào sẽ xảy ra.

Khi đối tượng {{domxref("DataTransfer")}} được tạo, `dropEffect` được đặt thành một giá trị chuỗi. Khi lấy, nó trả về giá trị hiện tại. Khi đặt, nếu giá trị mới là một trong các giá trị được liệt kê bên dưới, thì giá trị hiện tại của thuộc tính sẽ được đặt thành giá trị mới và các giá trị khác sẽ bị bỏ qua.

Đối với các sự kiện {{domxref("HTMLElement/dragenter_event", "dragenter")}} và {{domxref("HTMLElement/dragover_event", "dragover")}}, `dropEffect` sẽ được khởi tạo dựa trên hành động mà người dùng yêu cầu. Cách xác định điều này phụ thuộc vào nền tảng, nhưng thông thường người dùng có thể nhấn các phím bổ trợ như phím alt để điều chỉnh hành động mong muốn. Trong các trình xử lý sự kiện cho {{domxref("HTMLElement/dragenter_event", "dragenter")}} và {{domxref("HTMLElement/dragover_event", "dragover")}}, `dropEffect` nên được sửa đổi nếu muốn một hành động khác với hành động người dùng yêu cầu.

Đối với các sự kiện {{domxref("HTMLElement/drop_event", "drop")}} và {{domxref("HTMLElement/dragend_event", "dragend")}}, `dropEffect` sẽ được đặt thành hành động mong muốn, tức là giá trị mà `dropEffect` có sau sự kiện {{domxref("HTMLElement/dragenter_event", "dragenter")}} hoặc {{domxref("HTMLElement/dragover_event", "dragover")}} cuối cùng. Ví dụ trong sự kiện {{domxref("HTMLElement/dragend_event", "dragend")}}, nếu `dropEffect` mong muốn là "move", thì dữ liệu đang được kéo sẽ bị xóa khỏi nguồn.

## Giá trị

Một chuỗi đại diện cho hiệu ứng thao tác kéo. Các giá trị có thể là:

- `copy`
  - : Một bản sao của mục nguồn được tạo ở vị trí mới.
- `move`
  - : Một mục được chuyển đến vị trí mới.
- `link`
  - : Một liên kết được thiết lập đến nguồn tại vị trí mới.
- `none`
  - : Mục không thể được thả.

Việc gán bất kỳ giá trị nào khác cho `dropEffect` sẽ không có tác dụng và giá trị cũ được giữ nguyên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
