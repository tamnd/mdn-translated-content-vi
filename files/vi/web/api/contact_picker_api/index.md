---
title: Contact Picker API
slug: Web/API/Contact_Picker_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.ContactsManager
---

{{securecontext_header}}{{DefaultAPISidebar("Contact Picker API")}}{{SeeCompatTable}}

Contact Picker API cho phép người dùng chọn các mục từ danh bạ của họ và chia sẻ một lượng thông tin hạn chế của các mục đã chọn với một trang web hoặc ứng dụng.

> [!NOTE]
> API này _không khả dụng_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được phơi bày qua {{domxref("WorkerNavigator")}}).

## Khái niệm và cách sử dụng Contact Picker API

Việc truy cập danh bạ từ lâu đã là một tính năng có sẵn trong các ứng dụng gốc. Contacts Picker API mang chức năng đó đến cho các ứng dụng web.

Các trường hợp sử dụng bao gồm chọn liên hệ để nhắn tin qua ứng dụng email hoặc trò chuyện, chọn số điện thoại của một liên hệ để dùng với thoại qua IP (VOIP), hoặc tìm những liên hệ đã tham gia một nền tảng xã hội. Tác nhân người dùng cũng có thể mang lại trải nghiệm nhất quán với các ứng dụng khác trên thiết bị của người dùng.

Khi gọi phương thức {{domxref('ContactsManager.select', 'select')}} của giao diện {{domxref('ContactsManager')}}, người dùng sẽ được hiển thị bộ chọn liên hệ, nơi họ có thể chọn thông tin liên hệ để chia sẻ với ứng dụng web. Cần có tương tác của người dùng trước khi quyền hiển thị bộ chọn liên hệ được cấp, và quyền truy cập danh bạ không được duy trì lâu dài; người dùng phải cấp quyền mỗi khi ứng dụng gửi một yêu cầu.

API này chỉ khả dụng trong ngữ cảnh duyệt web cấp cao nhất bảo mật và được thiết kế rất cẩn thận với độ nhạy cảm cũng như quyền riêng tư của dữ liệu liên hệ. Người dùng là bên quyết định dữ liệu nào sẽ được chia sẻ, và API chỉ cho phép truy cập dữ liệu cụ thể của các liên hệ đã chọn, không cho phép truy cập dữ liệu của các liên hệ khác.

## Giao diện

- {{domxref("ContactAddress")}}
  - : Biểu diễn một địa chỉ thực tế.
- {{domxref("ContactsManager")}}
  - : Cung cấp cách để người dùng chọn và chia sẻ thông tin hạn chế của các liên hệ với một ứng dụng web.
- {{domxref("Navigator.contacts")}}
  - : Trả về một đối tượng {{domxref("ContactsManager")}}, từ đó có thể truy cập mọi chức năng khác.

## Ví dụ

### Phát hiện tính năng

Đoạn mã sau kiểm tra xem Contact Picker API có được hỗ trợ hay không.

```js
const supported = "contacts" in navigator;
```

### Kiểm tra các thuộc tính được hỗ trợ

Hàm bất đồng bộ sau dùng phương thức `getProperties()` để kiểm tra các thuộc tính được hỗ trợ.

```js
async function checkProperties() {
  const supportedProperties = await navigator.contacts.getProperties();
  if (supportedProperties.includes("name")) {
    // chạy mã cho hỗ trợ tên
  }
  if (supportedProperties.includes("email")) {
    // chạy mã cho hỗ trợ email
  }
  if (supportedProperties.includes("tel")) {
    // chạy mã cho hỗ trợ số điện thoại
  }
  if (supportedProperties.includes("address")) {
    // chạy mã cho hỗ trợ địa chỉ
  }
  if (supportedProperties.includes("icon")) {
    // chạy mã cho hỗ trợ ảnh đại diện
  }
}
```

### Chọn liên hệ

Ví dụ sau thiết lập một mảng các thuộc tính sẽ được lấy cho mỗi liên hệ, đồng thời thiết lập một đối tượng tùy chọn để cho phép chọn nhiều liên hệ.

Sau đó, một hàm bất đồng bộ được định nghĩa để dùng phương thức `select()` nhằm hiển thị giao diện bộ chọn liên hệ cho người dùng và xử lý các kết quả đã chọn.

```js
const props = ["name", "email", "tel", "address", "icon"];
const opts = { multiple: true };

async function getContacts() {
  try {
    const contacts = await navigator.contacts.select(props, opts);
    handleResults(contacts);
  } catch (ex) {
    // Xử lý mọi lỗi tại đây.
  }
}
```

`handleResults()` là một hàm do nhà phát triển định nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [A Contact Picker for the Web](https://developer.chrome.com/docs/capabilities/web-apis/contact-picker)
- [Bản trình diễn trực tiếp Contact Picker API](https://mdn.github.io/dom-examples/contact-picker/)
