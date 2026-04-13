---
title: ContactsManager
slug: Web/API/ContactsManager
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ContactsManager
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Giao diện **`ContactsManager`** của [Contact Picker API](/en-US/docs/Web/API/Contact_Picker_API) cho phép người dùng chọn các mục từ danh bạ của họ và chia sẻ một lượng thông tin giới hạn của những mục đã chọn với một trang web hoặc ứng dụng.

`ContactsManager` có sẵn thông qua thuộc tính toàn cục {{domxref('navigator.contacts')}}.

## Instance methods

- {{domxref('ContactsManager.select','select()')}} {{Experimental_Inline}}
  - : Trả về một {{jsxref('Promise')}} mà khi được giải quyết sẽ hiển thị cho người dùng một trình chọn liên hệ, cho phép họ chọn (các) liên hệ mà họ muốn chia sẻ.
- {{domxref('ContactsManager.getProperties()','getProperties()')}} {{Experimental_Inline}}
  - : Trả về một {{jsxref('Promise')}} được giải quyết với một {{jsxref('Array')}} gồm các {{jsxref('String','chuỗi')}} cho biết những thuộc tính liên hệ nào hiện có sẵn.

## Examples

### Feature Detection

Đoạn mã sau kiểm tra xem Contact Picker API có được hỗ trợ hay không.

```js
const supported = "contacts" in navigator && "ContactsManager" in window;
```

### Checking for Supported Properties

Hàm bất đồng bộ sau sử dụng phương thức `getProperties` để kiểm tra các thuộc tính được hỗ trợ.

```js
async function checkProperties() {
  const supportedProperties = await navigator.contacts.getProperties();
  if (supportedProperties.includes("name")) {
    // run code for name support
  }
  if (supportedProperties.includes("email")) {
    // run code for email support
  }
  if (supportedProperties.includes("tel")) {
    // run code for telephone number support
  }
  if (supportedProperties.includes("address")) {
    // run code for address support
  }
  if (supportedProperties.includes("icon")) {
    // run code for avatar support
  }
}
```

### Selecting Contacts

Ví dụ sau thiết lập một mảng các thuộc tính cần lấy cho từng liên hệ, đồng thời thiết lập một đối tượng tùy chọn để cho phép chọn nhiều liên hệ.

Sau đó một hàm bất đồng bộ được định nghĩa, sử dụng phương thức `select()` để hiển thị cho người dùng giao diện chọn liên hệ và xử lý kết quả đã chọn.

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

`handleResults()` là một hàm do nhà phát triển định nghĩa.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [A Contact Picker for the Web](https://developer.chrome.com/docs/capabilities/web-apis/contact-picker)
- [Contact Picker API live demo](https://mdn.github.io/dom-examples/contact-picker/)
