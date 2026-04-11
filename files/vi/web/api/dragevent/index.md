---
title: DragEvent
slug: Web/API/DragEvent
page-type: web-api-interface
browser-compat: api.DragEvent
---

{{APIRef("HTML Drag and Drop API")}}

**`DragEvent`** là một giao diện [DOM event](/en-US/docs/Web/API/Event) đại diện cho một tương tác kéo và thả. Người dùng bắt đầu kéo bằng cách đặt một thiết bị trỏ (chẳng hạn như chuột) lên bề mặt cảm ứng rồi kéo con trỏ đến một vị trí mới (chẳng hạn như một phần tử DOM khác). Ứng dụng có thể tự do diễn giải một tương tác kéo và thả theo cách riêng của ứng dụng.

Giao diện này kế thừa các thuộc tính từ {{domxref("MouseEvent")}} và {{domxref("Event")}}.

{{InheritanceDiagram}}

## Thuộc tính của thể hiện

- {{domxref('DragEvent.dataTransfer')}} {{ReadOnlyInline}}
  - : Dữ liệu được truyền trong quá trình tương tác kéo và thả.

## Hàm tạo

Mặc dù giao diện này có hàm tạo, không thể tạo một đối tượng DataTransfer hữu ích từ script, vì các đối tượng {{domxref("DataTransfer")}} có mô hình xử lý và bảo mật được trình duyệt điều phối trong suốt quá trình kéo và thả.

- {{domxref("DragEvent.DragEvent", "DragEvent()")}}
  - : Tạo một `DragEvent` tổng hợp và không đáng tin cậy.

## Kiểu sự kiện

- {{domxref("HTMLElement/drag_event", "drag")}}
  - : Sự kiện này được phát khi một phần tử hoặc vùng chọn văn bản đang được kéo.
- {{domxref("HTMLElement/dragend_event", "dragend")}}
  - : Sự kiện này được phát khi một thao tác kéo kết thúc (do nhả nút chuột hoặc nhấn phím escape).
- {{domxref("HTMLElement/dragenter_event", "dragenter")}}
  - : Sự kiện này được phát khi một phần tử hoặc vùng chọn văn bản đang bị kéo đi vào một vùng thả hợp lệ.
- {{domxref("HTMLElement/dragleave_event", "dragleave")}}
  - : Sự kiện này được phát khi một phần tử hoặc vùng chọn văn bản đang bị kéo rời khỏi một vùng thả hợp lệ.
- {{domxref("HTMLElement/dragover_event", "dragover")}}
  - : Sự kiện này được phát liên tục khi một phần tử hoặc vùng chọn văn bản đang được kéo và con trỏ chuột đang ở trên một vùng thả hợp lệ (mỗi 50 ms KHI chuột không di chuyển CÒN nếu không thì nhanh hơn nhiều, khoảng giữa 5 ms khi di chuyển chậm và 1 ms khi di chuyển nhanh). Mẫu phát này khác với {{domxref("Element/mouseover_event", "mouseover")}}.
- {{domxref("HTMLElement/dragstart_event", "dragstart")}}
  - : Sự kiện này được phát khi người dùng bắt đầu kéo một phần tử hoặc vùng chọn văn bản.
- {{domxref("HTMLElement/drop_event", "drop")}}
  - : Sự kiện này được phát khi một phần tử hoặc vùng chọn văn bản được thả lên một vùng thả hợp lệ.

## Ví dụ

Ví dụ cho từng thuộc tính, hàm tạo, kiểu sự kiện và trình xử lý sự kiện toàn cục được bao gồm trong trang tham chiếu tương ứng của chúng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Các thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
