---
title: ContactAddress
slug: Web/API/ContactAddress
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ContactAddress
---

{{securecontext_header}}{{APIRef("Contact Picker API")}}{{SeeCompatTable}}

Giao diện **`ContactAddress`** của [Contact Picker API](/en-US/docs/Web/API/Contact_Picker_API) biểu diễn một địa chỉ thực. Các thể hiện của giao diện này được lấy từ thuộc tính `address` của các đối tượng do {{domxref("ContactsManager.getProperties()")}} trả về.

Bạn cũng nên tham khảo tài liệu về [tiêu chuẩn địa chỉ S42](https://www.upu.int/en/Postal-Solutions/Programmes-Services/Addressing-Solutions#addressing-s42-standard) trên trang web của Liên minh Bưu chính Thế giới (Universal Postal Union), nơi cung cấp thông tin về các tiêu chuẩn quốc tế cho địa chỉ bưu chính.

## Thuộc tính thể hiện

- {{domxref('ContactAddress.addressLine')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một mảng chuỗi cung cấp từng dòng của địa chỉ không được bao gồm trong các thuộc tính khác. Kích thước và nội dung chính xác của mảng này thay đổi theo quốc gia hoặc địa điểm và có thể bao gồm, ví dụ, tên đường, số nhà, số căn hộ, tuyến phát hàng vùng nông thôn, chỉ dẫn mô tả hoặc số hộp thư bưu điện.
- {{domxref('ContactAddress.country')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chỉ định quốc gia nơi địa chỉ tọa lạc, sử dụng tiêu chuẩn [ISO-3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Chuỗi này luôn được cung cấp ở dạng chữ hoa chuẩn tắc. Một vài ví dụ về giá trị `country` hợp lệ: `"US"`, `"GB"`, `"CN"` hoặc `"JP"`.
- {{domxref('ContactAddress.city')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chứa phần thành phố hoặc thị trấn của địa chỉ.
- {{domxref('ContactAddress.dependentLocality')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi cho biết địa phương phụ thuộc hoặc khu vực con trong một thành phố, ví dụ như khu phố, quận, khu vực hoặc dependent locality ở Vương quốc Anh.
- {{domxref('ContactAddress.organization')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chỉ định tên của tổ chức, hãng, công ty hoặc cơ sở tại địa chỉ đó.
- {{domxref('ContactAddress.phone')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chỉ định số điện thoại của người nhận hoặc người liên hệ.
- {{domxref('ContactAddress.postalCode')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chỉ định mã được một khu vực pháp lý dùng để định tuyến thư, ví dụ như ZIP code ở Hoa Kỳ hoặc PIN code ở Ấn Độ.
- {{domxref('ContactAddress.recipient')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi cho biết tên người nhận, người mua hoặc người liên hệ tại địa chỉ.
- {{domxref('ContactAddress.region')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi chứa đơn vị hành chính cấp cao nhất của quốc gia, ví dụ như bang, tỉnh, oblast hoặc prefecture.
- {{domxref('ContactAddress.sortingCode')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một chuỗi cung cấp mã phân loại bưu chính như loại được dùng tại Pháp.

## Phương thức thể hiện

- {{domxref('ContactAddress.toJSON()')}} {{experimental_inline}}
  - : Bộ tuần tự hóa tiêu chuẩn trả về biểu diễn JSON của các thuộc tính của đối tượng `ContactAddress`.

## Ví dụ

Ví dụ sau nhắc người dùng chọn danh bạ, rồi in địa chỉ đầu tiên được trả về ra console.

```js
const props = ["address"];
const opts = { multiple: true };

async function getContacts() {
  try {
    const contacts = await navigator.contacts.select(props, opts);
    const contactAddress = contacts[0].address[0];
    console.log(contactAddress);
  } catch (ex) {
    // Handle any errors here.
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
