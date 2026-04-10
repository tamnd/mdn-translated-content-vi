---
title: "Element: thuộc tính ariaOwnsElements"
short-title: ariaOwnsElements
slug: Web/API/Element/ariaOwnsElements
page-type: web-api-instance-property
browser-compat: api.Element.ariaOwnsElements
---

{{APIRef("DOM")}}

Thuộc tính **`ariaOwnsElements`** của giao diện {{domxref("Element")}} là một mảng chứa (các) phần tử định nghĩa mối quan hệ trực quan, chức năng hoặc ngữ cảnh giữa phần tử cha mà nó được áp dụng và các phần tử con của nó. Điều này được sử dụng khi hệ thống phân cấp DOM không thể được sử dụng để biểu diễn mối quan hệ, và nếu không thì nó sẽ không khả dụng đối với công nghệ hỗ trợ.

Chủ đề [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) chứa thêm thông tin về cách sử dụng thuộc tính và property này.

## Giá trị

Một mảng các lớp con của {{domxref("HTMLElement")}}.

Khi đọc, mảng được trả về là tĩnh và chỉ đọc. Khi ghi, mảng được gán sẽ được sao chép: các thay đổi tiếp theo đối với mảng không ảnh hưởng đến giá trị của property.

## Mô tả

Property này là một giải pháp thay thế linh hoạt cho việc sử dụng thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) để chỉ định quyền sở hữu của một phần tử. Không giống như `aria-owns`, các phần tử được gán cho property này không cần có thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id).

Property này phản chiếu thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) của phần tử khi nó được định nghĩa, nhưng chỉ cho các giá trị `id` tham chiếu được liệt kê khớp với các phần tử hợp lệ trong phạm vi. Nếu property được thiết lập, thì thuộc tính tương ứng sẽ bị xóa. Để biết thêm thông tin về tham chiếu phần tử được phản chiếu và phạm vi, xem [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Thuộc tính phản chiếu_.

## Ví dụ

### Lấy phần tử được sở hữu

Ví dụ này minh họa cách thuộc tính và property `aria-owns` được sử dụng.

Đoạn mã định nghĩa một menu và menu con liên kết của nó trong các phần tử {{htmlelement("div")}} riêng biệt và không lồng nhau. Vì các phần tử này không lồng nhau nên mối quan hệ sở hữu giữa menu và menu con không được DOM nắm bắt. Ở đây chúng ta cung cấp thông tin đó cho công cụ hỗ trợ tiếp cận bằng cách sử dụng thuộc tính `aria-owns`, nhưng chúng ta cũng có thể làm điều đó bằng cách sử dụng property được phản chiếu.

Lưu ý rằng chúng ta có thể xây dựng một menu trong đó menu con được lồng nhau: ví dụ đã được _tạo ra_ để dễ dàng minh họa trường hợp mà mối quan hệ cần được định nghĩa.

#### HTML

HTML định nghĩa các phần tử {{htmlelement("div")}} cho menu, với `id=parentMenu` và menu con với `id="subMenu1"`. Chúng ta đã thêm một `<div>` ở giữa chỉ để làm cho rõ ràng hơn rằng không có mô hình sở hữu trực tiếp nào được định nghĩa trong DOM.

Phần tử `<div>` của menu cha bao gồm thuộc tính `aria-owns="subMenu1"` để tạo mối quan hệ sở hữu này.

```html
<div class="menu" id="parentMenu" role="menubar" aria-owns="subMenu1">
  Top level menu (hover over)
</div>

<div>Some other element</div>

<div class="submenu" id="subMenu1" role="menu">
  <a href="#" role="menuitem">Menu item 1</a>
  <a href="#" role="menuitem">Menu item 2</a>
  <a href="#" role="menuitem">Menu item 3</a>
</div>
```

#### CSS

CSS styled cho menu và menu con, và hiển thị menu con khi menu được di chuột qua.

```css
.menu {
  position: relative;
  display: inline-block;
  color: purple;
}

.submenu {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 6px 14px 0px rgb(0 0 0 / 0.2);
  z-index: 1;
  top: 20px;
  left: 0;
}

.menu:hover ~ .submenu {
  display: block;
}

.submenu a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.submenu a:hover {
  background-color: #f1f1f1;
}
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 80px;
  overflow: scroll;
  padding: 0.5rem;
  margin: 5px;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã trước tiên kiểm tra xem `ariaOwnsElements` có được hỗ trợ không. Nếu có, chúng ta ghi lại thuộc tính, các phần tử trong property và giá trị `id` cho mỗi phần tử.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
// Feature test for ariaOwnsElements
if ("ariaOwnsElements" in Element.prototype) {
  const parentMenu = document.querySelector("#parentMenu");
  log(`parentMenu.getAttribute(): ${parentMenu.getAttribute("aria-owns")}`);
  log(`parentMenu.ariaOwnsElements: ${parentMenu.ariaOwnsElements}`);
  parentMenu.ariaOwnsElements?.forEach((elem) => {
    log(`  id: ${elem.id}`);
  });
} else {
  log("element.ariaOwnsElements: not supported by browser");
}
```

#### Kết quả

Kết quả của việc chạy mã được hiển thị bên dưới. Nhật ký cho thấy mối quan hệ được định nghĩa bằng thuộc tính `aria-owns` được phản chiếu trong property `ariaOwnsElements` (các phần tử trong mảng khớp với tham chiếu phần tử của thuộc tính).

{{EmbedLiveSample("Get the flow-to element","100%","200px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto)
- {{domxref("ElementInternals.ariaOwnsElements")}}
- [Tham chiếu phần tử phản chiếu](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references) trong hướng dẫn _Phản chiếu thuộc tính_.
