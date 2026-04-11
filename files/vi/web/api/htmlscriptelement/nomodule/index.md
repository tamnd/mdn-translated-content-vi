---
title: "HTMLScriptElement: thuộc tính noModule"
short-title: noModule
slug: Web/API/HTMLScriptElement/noModule
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.noModule
---

{{APIRef("HTML DOM")}}

Thuộc tính **`noModule`** của giao diện {{domxref("HTMLScriptElement")}} là một giá trị boolean cho biết liệu tập lệnh có được thực thi trong các trình duyệt hỗ trợ [ES modules](/en-US/docs/Web/JavaScript/Guide/Modules) hay không. Thực tế, thuộc tính này có thể được dùng để cung cấp các tập lệnh dự phòng cho các trình duyệt cũ không hỗ trợ JavaScript modules.

Nó phản ánh thuộc tính `nomodule` của phần tử {{HTMLElement("script")}}.

## Giá trị

Một giá trị boolean: `true` có nghĩa là tập lệnh không nên được thực thi trong các trình duyệt hỗ trợ ES modules, ngược lại là `false`.

## Ví dụ

```html
<script id="el" nomodule>
  // Nếu trình duyệt hỗ trợ JavaScript modules, đoạn script sau sẽ không được thực thi.
  console.log("The browser does not support JavaScript modules");
</script>
```

```js
const el = document.getElementById("el");
console.log(el.noModule); // Kết quả: true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
