---
title: "CustomElementRegistry: whenDefined() method"
short-title: whenDefined()
slug: Web/API/CustomElementRegistry/whenDefined
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.whenDefined
---

{{APIRef("Web Components")}}

Phương thức **`whenDefined()`** của giao diện {{domxref("CustomElementRegistry")}} trả về một {{jsxref("Promise")}} sẽ được giải quyết khi element có tên đã cho được định nghĩa.

## Cú pháp

```js-nolint
whenDefined(name)
```

### Tham số

- `name`
  - : Tên của custom element.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ hoàn tất với constructor của [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) khi custom element được định nghĩa với tên đã cho.
Nếu custom element đó đã được định nghĩa với tên này, promise sẽ hoàn tất ngay lập tức.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : [name](#name) được cung cấp không phải là [tên custom element hợp lệ](/en-US/docs/Web/API/CustomElementRegistry/define#valid_custom_element_names).

## Ví dụ

### Sử dụng cơ bản

Ví dụ này dùng `whenDefined()` để phát hiện khi các custom element tạo nên một menu được định nghĩa.
Menu hiển thị nội dung giữ chỗ cho đến khi nội dung menu thực sự sẵn sàng để hiển thị.

```html
<nav id="menu-container">
  <div class="menu-placeholder">Loading…</div>
  <nav-menu>
    <menu-item>Item 1</menu-item>
    <menu-item>Item 2</menu-item>
    …
    <menu-item>Item N</menu-item>
  </nav-menu>
</nav>
```

```js
const container = document.getElementById("menu-container");
const placeholder = container.querySelector(".menu-placeholder");
// Fetch all the children of menu that are not yet defined.
const undefinedElements = container.querySelectorAll(":not(:defined)");

async function removePlaceholder() {
  // Filter the elements down to unique localNames
  const tags = new Set(
    [...undefinedElements].map((button) => button.localName),
  );
  const promises = [...tags].map((tag) => customElements.whenDefined(tag));

  // Wait for all the children to be upgraded
  await Promise.all(promises);
  // then remove the placeholder
  container.removeChild(placeholder);
}

removePlaceholder();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
