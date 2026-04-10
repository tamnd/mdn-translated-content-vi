---
title: ShadowRoot
slug: Web/API/ShadowRoot
page-type: web-api-interface
browser-compat: api.ShadowRoot
---

{{APIRef("Shadow DOM")}}

Giao diện **`ShadowRoot`** của [Shadow DOM API](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) là nút gốc của một cây con DOM được hiển thị riêng biệt với cây DOM chính của tài liệu.

Bạn có thể lấy tham chiếu đến shadow root của một phần tử bằng thuộc tính {{domxref("Element.shadowRoot")}}, với điều kiện nó được tạo bằng {{domxref("Element.attachShadow()")}} và tùy chọn `mode` được đặt thành `open`.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("ShadowRoot.activeElement")}} {{ReadOnlyInline}}
  - : Trả về {{domxref('Element')}} bên trong cây shadow đang có tiêu điểm.
- {{domxref("ShadowRoot.adoptedStyleSheets")}}
  - : Thêm một mảng các stylesheet được tạo sẵn để cây con shadow DOM sử dụng. Các stylesheet này có thể được chia sẻ với các cây con DOM khác có cùng nút cha {{domxref("Document")}}, và với chính tài liệu.
- {{domxref("ShadowRoot.clonable")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết shadow root có thể sao chép được hay không.
- {{domxref("ShadowRoot.customElementRegistry")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("CustomElementRegistry")}} liên kết với shadow root này, hoặc `null` nếu chưa được đặt.
- {{domxref("ShadowRoot.delegatesFocus")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết shadow root có ủy quyền tiêu điểm hay không khi một nút không thể nhận tiêu điểm được chọn.
- {{DOMxRef("ShadowRoot.fullscreenElement")}} {{ReadOnlyInline}}
  - : Phần tử hiện đang ở chế độ toàn màn hình cho cây shadow này.
- {{domxref("ShadowRoot.host")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phần tử DOM mà `ShadowRoot` được gắn vào.
- {{domxref("ShadowRoot.innerHTML")}}
  - : Đặt hoặc trả về cấu trúc DOM bên trong `ShadowRoot`.
- {{domxref("ShadowRoot.mode")}} {{ReadOnlyInline}}
  - : Chế độ của `ShadowRoot`, hoặc `open` hoặc `closed`. Điều này xác định các tính năng nội bộ của shadow root có thể truy cập từ JavaScript hay không.
- {{DOMxRef("ShadowRoot.pictureInPictureElement")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef('Element')}} bên trong cây shadow đang được trình bày ở chế độ picture-in-picture.
- {{DOMxRef("ShadowRoot.pointerLockElement")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef('Element')}} được đặt làm đích cho các sự kiện chuột khi con trỏ bị khóa. `null` nếu đang chờ khóa, con trỏ chưa được khóa, hoặc đích nằm trong cây khác.
- `ShadowRoot.referenceTarget` {{Experimental_Inline}} {{non-standard_inline}}
  - : Một giá trị chuỗi có thể null, biểu thị đích hiệu lực của mọi tham chiếu phần tử được tạo đối với shadow host từ bên ngoài host element. Giá trị này phải là ID của một phần tử bên trong shadow DOM. Nếu được đặt, các tham chiếu đích đến host element từ bên ngoài shadow DOM sẽ khiến phần tử đích được tham chiếu trở thành đích hiệu lực của tham chiếu đến host element.
- {{DOMxRef("ShadowRoot.serializable")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết shadow root có thể tuần tự hóa hay không. Một shadow root có thể tuần tự hóa bên trong một phần tử sẽ được tuần tự hóa bởi {{DOMxRef('Element.getHTML()')}} hoặc {{DOMxRef('ShadowRoot.getHTML()')}} khi tham số [`options.serializableShadowRoots`](/en-US/docs/Web/API/Element/getHTML#serializableshadowroots) được đặt thành `true`. Giá trị này được thiết lập khi shadow root được tạo.
- {{DOMxRef("ShadowRoot.slotAssignment")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa kiểu gán slot, hoặc `manual` hoặc `named`.
- {{domxref("ShadowRoot.styleSheets")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref('StyleSheetList')}} gồm các đối tượng {{domxref('CSSStyleSheet')}} cho các stylesheet được liên kết trực tiếp hoặc nhúng vào cây shadow.

## Phương thức thể hiện

- {{DOMxRef("ShadowRoot.getAnimations()")}}
  - : Trả về một mảng gồm tất cả các đối tượng {{DOMxRef("Animation")}} hiện đang có hiệu lực, mà phần tử đích của chúng là các phần tử hậu duệ của cây shadow.
- {{domxref("ShadowRoot.getSelection()")}} {{Non-standard_Inline}}
  - : Trả về một đối tượng {{domxref('Selection')}} biểu thị vùng văn bản được người dùng chọn, hoặc vị trí hiện tại của con trỏ nhập liệu.
- {{domxref("ShadowRoot.elementFromPoint()")}} {{Non-standard_Inline}}
  - : Trả về phần tử ở vị trí cao nhất tại tọa độ được chỉ định.
- {{domxref("ShadowRoot.elementsFromPoint()")}} {{Non-standard_Inline}}
  - : Trả về một mảng gồm tất cả các phần tử tại tọa độ được chỉ định.
- {{DOMxRef("ShadowRoot.setHTML()")}} {{experimental_inline}}
  - : Cung cấp một phương thức an toàn trước XSS để phân tích cú pháp và làm sạch một chuỗi HTML thành một {{domxref("DocumentFragment")}}, rồi fragment đó thay thế cây hiện có trong shadow DOM.
- {{DOMxRef("ShadowRoot.setHTMLUnsafe()")}}
  - : Phân tích cú pháp một chuỗi HTML thành một document fragment mà không làm sạch, rồi fragment đó thay thế cây con gốc của shadow root. Chuỗi HTML có thể bao gồm các declarative shadow root, chúng sẽ được phân tích thành các phần tử template khi HTML được thiết lập bằng [`ShadowRoot.innerHTML`](/en-US/docs/Web/API/ShadowRoot/innerHTML).

## Sự kiện

Các sự kiện sau có thể dùng với `ShadowRoot` thông qua việc sự kiện bubble từ {{domxref("HTMLSlotElement")}}:

- Sự kiện {{domxref("HTMLSlotElement.slotchange_event", "slotchange")}} của `HTMLSlotElement`
  - : Sự kiện được phát ra khi nút hoặc các nút chứa trong slot đó thay đổi.

## Ví dụ

Các đoạn sau được lấy từ ví dụ [life-cycle-callbacks](https://github.com/mdn/web-components-examples/tree/main/life-cycle-callbacks) của chúng tôi ([xem bản live](https://mdn.github.io/web-components-examples/life-cycle-callbacks/)), ví dụ này tạo một phần tử hiển thị một hình vuông có kích thước và màu sắc được chỉ định trong các thuộc tính của phần tử.

Bên trong định nghĩa lớp của phần tử `<custom-square>`, chúng ta bao gồm một số callback vòng đời gọi đến một hàm bên ngoài, `updateStyle()`, hàm này thực sự áp dụng kích thước và màu sắc cho phần tử. Bạn sẽ thấy rằng chúng ta truyền `this` (chính custom element) làm tham số.

```js
class Square extends HTMLElement {
  // …
  connectedCallback() {
    console.log("Custom square element added to page.");
    updateStyle(this);
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log("Custom square element attributes changed.");
    updateStyle(this);
  }
  // …
}
```

Trong chính hàm `updateStyle()`, chúng ta lấy tham chiếu đến shadow DOM bằng {{domxref("Element.shadowRoot")}}.
Từ đây, chúng ta dùng các kỹ thuật duyệt DOM tiêu chuẩn để tìm phần tử {{htmlelement("style")}} bên trong shadow DOM và sau đó cập nhật CSS nằm trong đó:

```js
function updateStyle(elem) {
  const shadow = elem.shadowRoot;
  const childNodes = shadow.childNodes;
  for (const node of childNodes) {
    if (node.nodeName === "STYLE") {
      node.textContent = `
div {
  width: ${elem.getAttribute("l")}px;
  height: ${elem.getAttribute("l")}px;
  background-color: ${elem.getAttribute("c")};
}
      `;
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- [Web components](/en-US/docs/Web/API/Web_components)
