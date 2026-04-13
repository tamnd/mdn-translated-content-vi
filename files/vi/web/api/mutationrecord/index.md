---
title: MutationRecord
slug: Web/API/MutationRecord
page-type: web-api-interface
browser-compat: api.MutationRecord
---

{{APIRef("DOM")}}

**`MutationRecord`** là một giao diện chỉ đọc biểu diễn một biến đổi DOM riêng lẻ được quan sát bởi {{domxref("MutationObserver")}}. Đây là đối tượng nằm trong mảng được truyền vào hàm callback của {{domxref("MutationObserver")}}.

## Thuộc tính thể hiện

- {{domxref("MutationRecord.addedNodes")}} {{ReadOnlyInline}}
  - : Các nút được thêm bởi một biến đổi. Sẽ là một {{domxref("NodeList")}} rỗng nếu không có nút nào được thêm.
- {{domxref("MutationRecord.attributeName")}} {{ReadOnlyInline}}
  - : Tên của thuộc tính đã thay đổi, dưới dạng một chuỗi, hoặc `null`.
- {{domxref("MutationRecord.attributeNamespace")}} {{ReadOnlyInline}}
  - : Namespace của thuộc tính đã thay đổi, dưới dạng một chuỗi, hoặc `null`.
- {{domxref("MutationRecord.nextSibling")}} {{ReadOnlyInline}}
  - : Anh em kế tiếp của các nút được thêm hoặc xóa, hoặc `null`.
- {{domxref("MutationRecord.oldValue")}} {{ReadOnlyInline}}
  - : Giá trị phụ thuộc vào {{domxref("MutationRecord.type")}}:
    - Với `attributes`, đây là giá trị của thuộc tính đã thay đổi trước khi thay đổi xảy ra.
    - Với `characterData`, đây là dữ liệu của nút đã thay đổi trước khi thay đổi xảy ra.
    - Với `childList`, đây là `null`.
- {{domxref("MutationRecord.previousSibling")}} {{ReadOnlyInline}}
  - : Anh em trước đó của các nút được thêm hoặc xóa, hoặc `null`.
- {{domxref("MutationRecord.removedNodes")}} {{ReadOnlyInline}}
  - : Các nút bị xóa bởi một biến đổi. Sẽ là một {{domxref("NodeList")}} rỗng nếu không có nút nào bị xóa.
- {{domxref("MutationRecord.target")}} {{ReadOnlyInline}}
  - : Nút bị biến đổi tác động tới, tùy thuộc vào `MutationRecord.type`.
    - Với `attributes`, đây là phần tử có thuộc tính đã thay đổi.
    - Với `characterData`, đây là nút `CharacterData`.
    - Với `childList`, đây là nút có các phần tử con đã thay đổi.
- {{domxref("MutationRecord.type")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị kiểu biến đổi: `attributes` nếu biến đổi là một biến đổi thuộc tính, `characterData` nếu đó là biến đổi trên nút `CharacterData`, và `childList` nếu đó là biến đổi trên cây nút.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
