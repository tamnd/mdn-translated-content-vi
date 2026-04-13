---
title: "ContactsManager: phương thức select()"
short-title: select()
slug: Web/API/ContactsManager/select
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ContactsManager.select
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Phương thức **`select()`** của giao diện {{domxref("ContactsManager")}} trả về một {{jsxref('Promise')}} mà khi được giải quyết sẽ hiển thị cho người dùng một trình chọn liên hệ, cho phép họ chọn (các) liên hệ mà họ muốn chia sẻ. Phương thức này yêu cầu một thao tác của người dùng để {{jsxref('Promise')}} có thể được giải quyết.

## Syntax

```js-nolint
select(properties)
select(properties, options)
```

### Parameters

- `properties`
  - : Một mảng {{jsxref('String', 'chuỗi')}} xác định thông tin nào cần lấy từ một liên hệ. Các giá trị được phép như sau:
    - `'name'`: Tên của liên hệ.
    - `'tel'`: (Các) số điện thoại của liên hệ.
    - `'email'`: Địa chỉ email của liên hệ.
    - `'address'`: Địa chỉ bưu chính của liên hệ.
    - `'icon'`: Ảnh đại diện của liên hệ.

- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `multiple`
      - : Một giá trị Boolean cho phép chọn nhiều liên hệ. Giá trị mặc định là `false`.

### Return value

Trả về một {{jsxref('Promise')}} được giải quyết với một mảng các đối tượng chứa thông tin liên hệ. Mỗi đối tượng đại diện cho một liên hệ duy nhất và có thể chứa các thuộc tính sau:

- `address`
  - : Một {{jsxref("Array")}} các đối tượng {{domxref("ContactAddress")}}, mỗi đối tượng chứa chi tiết của một địa chỉ thực riêng biệt.
- `email`
  - : Một mảng chuỗi chứa các địa chỉ email.
- `icon`
  - : Một mảng các đối tượng {{domxref("Blob")}} chứa hình ảnh của một cá nhân.
- `name`
  - : Một mảng chuỗi, mỗi chuỗi chứa một tên riêng biệt của một cá nhân.
- `tel`
  - : Một mảng chuỗi, mỗi chuỗi chứa một số điện thoại riêng biệt của một cá nhân.

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu ngữ cảnh duyệt web không phải là cấp cao nhất, nếu trình chọn liên hệ hiển thị một cờ báo hiệu rằng đã có sẵn một trình chọn liên hệ khác vì tại một thời điểm chỉ có thể tồn tại một trình chọn, hoặc nếu việc khởi chạy trình chọn liên hệ thất bại.
- `SecurityError` {{domxref("DOMException")}}
  - : Được trả về nếu phương thức không được kích hoạt bởi [kích hoạt của người dùng](/en-US/docs/Web/Security/Defenses/User_activation).
- {{jsxref("TypeError")}}
  - : Được trả về nếu `properties` rỗng, hoặc nếu bất kỳ thuộc tính nào được chỉ định không được hỗ trợ.

## Security

Cần có {{Glossary("Transient activation")}}. Người dùng phải tương tác với trang hoặc với một phần tử giao diện người dùng để tính năng này hoạt động.

## Examples

### Basic Example

Ví dụ sau thiết lập một mảng các thuộc tính cần lấy cho từng liên hệ, đồng thời thiết lập một đối tượng tùy chọn để cho phép chọn nhiều liên hệ.

Sau đó một hàm bất đồng bộ được định nghĩa, sử dụng phương thức `select()` để hiển thị cho người dùng giao diện chọn liên hệ và xử lý kết quả đã chọn. `handleResults()` là một hàm do nhà phát triển định nghĩa.

```js
const props = ["name", "email", "tel", "address", "icon"];
const opts = { multiple: true };

async function getContacts() {
  try {
    const contacts = await navigator.contacts.select(props, opts);
    handleResults(contacts);
  } catch (ex) {
    // Handle any errors here.
  }
}
```

### Select Using Only Supported Properties

Ví dụ sau sử dụng {{domxref("ContactsManager.getProperties", "getProperties()")}} để bảo đảm rằng chỉ các thuộc tính được hỗ trợ mới được truyền vào. Nếu không, `select()` có thể ném ra {{jsxref("TypeError")}}. `handleResults()` là một hàm do nhà phát triển định nghĩa.

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
