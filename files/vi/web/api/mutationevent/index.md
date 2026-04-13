---
title: MutationEvent
slug: Web/API/MutationEvent
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent
---

{{APIRef("UI Events")}}{{Deprecated_Header}}{{non-standard_header}}

Giao diện **`MutationEvent`** cung cấp các thuộc tính sự kiện đặc thù cho các sửa đổi đối với hệ thống phân cấp Document Object Model (DOM) và các nút.

> [!NOTE]
> Việc sử dụng _mutation events_ có vấn đề:
>
> - Thiết kế của chúng [có sai sót](https://lists.w3.org/Archives/Public/public-webapps/2011JulSep/0779.html).
> - Việc thêm các trình lắng nghe DOM mutation vào một tài liệu [làm giảm đáng kể hiệu suất](https://groups.google.com/g/mozilla.dev.platform/c/L0Lx11u5Bvs?pli=1) của các sửa đổi DOM tiếp theo đối với tài liệu đó (làm chậm chúng 1,5 đến 7 lần!). Hơn nữa, việc xóa các trình lắng nghe không đảo ngược thiệt hại.
> - Chúng có khả năng tương thích trình duyệt kém: Safari không hỗ trợ `DOMAttrModified` (xem [WebKit bug 8191](https://webkit.org/b/8191)) và Firefox không hỗ trợ _mutation name events_ (như `DOMElementNameChanged` và `DOMAttributeNameChanged`).
>
> Chúng đã bị lỗi thời để ủng hộ [mutation observers](/en-US/docs/Web/API/MutationObserver). **Hãy cân nhắc sử dụng những thứ này thay thế.**

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha {{domxref("UIEvent")}}, và gián tiếp từ {{domxref("Event")}}._

- {{domxref("MutationEvent.attrChange")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Cho biết loại thay đổi nào đã kích hoạt sự kiện `DOMAttrModified`. Nó có thể là `MODIFICATION` (`1`), `ADDITION` (`2`) hoặc `REMOVAL` (`3`). Nó không có ý nghĩa cho các sự kiện khác và được đặt thành `0`.
- {{domxref("MutationEvent.attrName")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Cho biết tên của nút bị ảnh hưởng bởi sự kiện `DOMAttrModified`. Nó không có ý nghĩa cho các sự kiện khác và được đặt thành chuỗi rỗng (`""`).
- {{domxref("MutationEvent.newValue")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Trong các sự kiện `DOMAttrModified`, chứa giá trị mới của nút {{domxref("Attr")}} được sửa đổi. Trong các sự kiện `DOMCharacterDataModified`, chứa giá trị mới của nút {{domxref("CharacterData")}} được sửa đổi. Trong tất cả các trường hợp khác, trả về chuỗi rỗng (`""`).
- {{domxref("MutationEvent.prevValue")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Trong các sự kiện `DOMAttrModified`, chứa giá trị trước đó của nút {{domxref("Attr")}} được sửa đổi. Trong các sự kiện `DOMCharacterDataModified`, chứa giá trị trước đó của nút {{domxref("CharacterData")}} được sửa đổi. Trong tất cả các trường hợp khác, trả về chuỗi rỗng (`""`).
- {{domxref("MutationEvent.relatedNode")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Cho biết nút liên quan đến sự kiện, như nút được thay đổi bên trong cây con cho `DOMSubtreeModified`.

## Phương thức phiên bản

- {{domxref("MutationEvent.initMutationEvent()")}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Phương thức khởi tạo trả về một `MutationEvent` mới được cấu hình với các tham số đã cho.

## Danh sách mutation events

Sau đây là danh sách tất cả mutation events:

- `DOMAttrModified` (Không được hỗ trợ bởi Safari)
- `DOMAttributeNameChanged` (Không được hỗ trợ bởi Firefox)
- `DOMCharacterDataModified`
- `DOMElementNameChanged` (Không được hỗ trợ bởi Firefox)
- `DOMNodeInserted`
- `DOMNodeInsertedIntoDocument`
- `DOMNodeRemoved`
- `DOMNodeRemovedFromDocument`
- `DOMSubtreeModified`

## Ví dụ

Bạn có thể đăng ký trình lắng nghe cho mutation events bằng {{DOMxRef("EventTarget.addEventListener()")}} như sau:

```js
element.addEventListener("DOMNodeInserted", (event) => {
  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("MutationObserver")}}
