---
title: "ARIA: thuộc tính aria-grabbed"
short-title: aria-grabbed
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-grabbed
page-type: aria-attribute
status:
  - deprecated
spec-urls: https://w3c.github.io/aria/#aria-grabbed
sidebar: accessibilitysidebar
---

Trạng thái `aria-grabbed` cho biết trạng thái "đang được nắm" của một phần tử trong thao tác kéo và thả. {{deprecated_inline}}

## Mô tả

Phần văn bản được chọn, hình ảnh và liên kết có thể được kéo theo mặc định. Việc đặt thuộc tính toàn cục [`draggable="true"`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable), là một phần của [Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) của HTML5, cùng với một bộ xử lý sự kiện [`dragstart`](/en-US/docs/Web/API/HTMLElement/dragstart_event), có nghĩa là bất kỳ nút DOM nào cũng có thể được làm cho kéo được.

Thuộc tính `aria-grabbed` từng được dùng để cho biết một phần tử đang ở trạng thái "đã nắm" trong thao tác kéo và thả với `aria-grabbed="true"`, hoặc phần tử có thể được nắm nhưng hiện chưa được nắm với `aria-grabbed="false"`.

Đặt `aria-grabbed="true"` cho biết phần tử đã được chọn để kéo. Đặt `aria-grabbed="false"` cho biết phần tử có thể được nắm cho thao tác kéo và thả, nhưng hiện chưa được nắm.

Khi `aria-grabbed` được đặt thành `true`, thuộc tính [`aria-dropeffect`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-dropeffect) của tất cả các đích thả tiềm năng nên được cập nhật bằng kiểu chức năng, hay hiệu ứng, sẽ xảy ra với phần tử được nắm khi nó được thả. Khi không có phần tử nào ở trạng thái nắm, hãy đặt lại các thuộc tính `aria-dropeffect` của tất cả các đích thả.

Thuộc tính `aria-grabbed` dự kiến sẽ được thay thế bằng một tính năng mới trong một phiên bản tương lai của WAI-ARIA và được xem là đã lỗi thời.

> [!NOTE]
> ARIA không làm cho chức năng trở nên có trợ năng. ARIA chỉ truyền đạt hành vi dự định của chức năng đó.

## Giá trị

- `true`
  - : Phần tử đã được chọn để kéo.
- `false`
  - : Phần tử hiện chưa được chọn để kéo, nhưng có thể được cho phép kéo bằng cách đặt thuộc tính thành `true`.
- `undefined` (mặc định)
  - : Phần tử không hỗ trợ kéo

## Vai trò liên quan

Được dùng trong **TẤT CẢ** [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-dropeffect`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-dropeffect)
- [Thuộc tính toàn cục HTML `draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable)
- [Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) của HTML
- {{domxref('dataTransfer')}}
- {{domxref('DataTransfer.dropEffect')}}
- {{domxref("HTMLElement/dragstart_event", "dragstart")}}
