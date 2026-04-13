---
title: "DataTransfer: thuộc tính effectAllowed"
short-title: effectAllowed
slug: Web/API/DataTransfer/effectAllowed
page-type: web-api-instance-property
browser-compat: api.DataTransfer.effectAllowed
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính **`DataTransfer.effectAllowed`** chỉ định hiệu ứng được phép cho thao tác kéo. Thao tác _copy_ được sử dụng để cho biết dữ liệu đang được kéo sẽ được sao chép từ vị trí hiện tại sang vị trí thả. Thao tác _move_ được sử dụng để cho biết dữ liệu đang được kéo sẽ được di chuyển, và thao tác _link_ được sử dụng để cho biết một số dạng mối quan hệ hoặc kết nối sẽ được tạo giữa vị trí nguồn và vị trí thả.

Thuộc tính này nên được đặt trong sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}} để thiết lập hiệu ứng kéo mong muốn cho nguồn kéo. Trong các trình xử lý sự kiện {{domxref("HTMLElement/dragenter_event", "dragenter")}} và {{domxref("HTMLElement/dragover_event", "dragover")}}, thuộc tính này sẽ được đặt thành bất kỳ giá trị nào đã được gán trong sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}}, do đó `effectAllowed` có thể được sử dụng để xác định hiệu ứng nào được phép.

Việc gán giá trị cho `effectAllowed` trong các sự kiện khác ngoài {{domxref("HTMLElement/dragstart_event", "dragstart")}} sẽ không có tác dụng.

## Giá trị

Một chuỗi đại diện cho thao tác kéo được phép. Các giá trị có thể là:

- `none`
  - : Mục không thể được thả.
- `copy`
  - : Có thể tạo bản sao của mục nguồn ở vị trí mới.
- `copyLink`
  - : Cho phép thao tác sao chép hoặc liên kết.
- `copyMove`
  - : Cho phép thao tác sao chép hoặc di chuyển.
- `link`
  - : Có thể thiết lập liên kết đến nguồn ở vị trí mới.
- `linkMove`
  - : Cho phép thao tác liên kết hoặc di chuyển.
- `move`
  - : Có thể di chuyển một mục đến vị trí mới.
- `all`
  - : Tất cả các thao tác đều được phép.
- `uninitialized`
  - : Giá trị mặc định khi hiệu ứng chưa được đặt, tương đương với `all`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
