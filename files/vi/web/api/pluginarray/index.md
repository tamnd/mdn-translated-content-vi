---
title: PluginArray
slug: Web/API/PluginArray
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.PluginArray
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Giao diện `PluginArray` được sử dụng để lưu trữ danh sách các đối tượng {{DOMxRef("Plugin")}}; nó được trả về bởi thuộc tính {{DOMxRef("Navigator.plugins", "navigator.plugins")}}. `PluginArray` không phải là mảng JavaScript, nhưng có thuộc tính `length` và hỗ trợ truy cập từng mục bằng ký hiệu ngoặc vuông (`plugins[2]`), cũng như thông qua các phương thức `item(index)` và `namedItem("name")`.

> [!NOTE]
> Các thuộc tính riêng của đối tượng `PluginArray` không còn liệt kê được trong các phiên bản trình duyệt mới nhất.

## Thuộc tính phiên bản

- {{DOMxRef("PluginArray.length")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Số lượng plugin trong mảng.

## Phương thức phiên bản

- {{DOMxRef("PluginArray.item")}} {{Deprecated_Inline}}
  - : Trả về {{DOMxRef("Plugin")}} tại chỉ số được chỉ định trong mảng.
- {{DOMxRef("PluginArray.namedItem")}} {{Deprecated_Inline}}
  - : Trả về {{DOMxRef("Plugin")}} với tên được chỉ định.
- {{DOMxRef("PluginArray.refresh")}} {{Deprecated_Inline}}
  - : Làm mới tất cả các plugin trên trang hiện tại, tùy chọn tải lại tài liệu.

## Ví dụ

Hàm ví dụ sau trả về phiên bản của plugin Shockwave Flash.

```js
const pluginsLength = navigator.plugins.length;

document.body.innerHTML =
  `${pluginsLength} Plugin(s)<br>` +
  `<table id="pluginTable"><thead>` +
  `<tr><th>Name</th><th>Filename</th><th>description</th><th>version</th></tr>` +
  `</thead><tbody></tbody></table>`;

const table = document.getElementById("pluginTable");

for (let i = 0; i < pluginsLength; i++) {
  let newRow = table.insertRow();
  newRow.insertCell().textContent = navigator.plugins[i].name;
  newRow.insertCell().textContent = navigator.plugins[i].filename;
  newRow.insertCell().textContent = navigator.plugins[i].description;
  newRow.insertCell().textContent = navigator.plugins[i].version ?? "";
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
