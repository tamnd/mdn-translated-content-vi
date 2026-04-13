---
title: "ContactsManager: phương thức getProperties()"
short-title: getProperties()
slug: Web/API/ContactsManager/getProperties
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ContactsManager.getProperties
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Phương thức **`getProperties()`** của giao diện {{domxref("ContactsManager")}} trả về một {{jsxref('Promise')}} được giải quyết với một {{jsxref('Array')}} gồm các {{jsxref('String','chuỗi')}} cho biết những thuộc tính liên hệ nào hiện có sẵn.

## Syntax

```js-nolint
getProperties()
```

### Parameters

Không có.

### Return value

Trả về một {{jsxref('Promise')}} được giải quyết với một {{jsxref('Array')}} gồm các {{jsxref('String','chuỗi')}} đặt tên cho các thuộc tính liên hệ mà hệ thống hiện tại có thể trả về.

Các thuộc tính có thể bao gồm:

- `'name'`: Tên của liên hệ.
- `'tel'`: (Các) số điện thoại của liên hệ.
- `'email'`: Địa chỉ email của liên hệ.
- `'address'`: Địa chỉ bưu chính của liên hệ.
- `'icon'`: Ảnh đại diện của liên hệ.

### Exceptions

Không có ngoại lệ nào được ném ra.

## Examples

### Verify Property Support

Hàm bất đồng bộ sau sử dụng phương thức `getProperties()` để kiểm tra xem hệ thống hiện tại có hỗ trợ thuộc tính `icon` hay không.

```js
async function checkProperties() {
  const supportedProperties = await navigator.contacts.getProperties();
  if (!supportedProperties.includes("icon")) {
    console.log("Your system does not support getting icons.");
  }
}
```

### Select Using Only Supported Properties

Ví dụ sau tương tự như ví dụ cho phương thức {{domxref("ContactsManager.select", "select()")}}. Thay vì mã hóa cứng các thuộc tính truyền vào `select()`, ví dụ này dùng `getProperties()` để đảm bảo rằng chỉ những thuộc tính được hỗ trợ mới được truyền vào. Nếu không, `select()` có thể ném ra {{jsxref("TypeError")}}. `handleResults()` là một hàm do nhà phát triển định nghĩa.

```js
const supportedProperties = await navigator.contacts.getProperties();

async function getContacts() {
  try {
    const contacts = await navigator.contacts.select(supportedProperties);
    handleResults(contacts);
  } catch (ex) {
    // Handle any errors here.
  }
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
