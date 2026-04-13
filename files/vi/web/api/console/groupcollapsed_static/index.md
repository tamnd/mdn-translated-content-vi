---
title: "console: phương thức tĩnh groupCollapsed()"
short-title: groupCollapsed()
slug: Web/API/console/groupCollapsed_static
page-type: web-api-static-method
browser-compat: api.console.groupCollapsed_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.groupCollapsed()`** tạo một nhóm nội tuyến mới trong console. Tuy nhiên, khác với {{domxref("console/group_static", "console.group()")}}, nhóm mới được tạo ở trạng thái thu gọn. Người dùng sẽ cần dùng nút bung/gập bên cạnh để mở nó ra, từ đó xem được các mục được tạo trong nhóm.

Gọi {{domxref("console/groupEnd_static", "console.groupEnd()")}} để quay lại nhóm cha.

Xem [Sử dụng nhóm trong console](/en-US/docs/Web/API/console#using_groups_in_the_console) trong tài liệu của {{domxref("console")}} để biết chi tiết và ví dụ.

## Cú pháp

```js-nolint
console.groupCollapsed()
console.groupCollapsed(label)
```

### Tham số

- `label` {{Optional_Inline}}
  - : Nhãn cho nhóm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("console/group_static", "console.group()")}}
- {{domxref("console/groupEnd_static", "console.groupEnd()")}}
- [Tài liệu của Microsoft Edge về `console.groupCollapsed()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#groupcollapsed)
- [Tài liệu của Node.js về `console.groupCollapsed()`](https://nodejs.org/docs/latest/api/console.html#consolegroupcollapsed)
- [Tài liệu của Google Chrome về `console.groupCollapsed()`](https://developer.chrome.com/docs/devtools/console/api/#groupcollapsed)
