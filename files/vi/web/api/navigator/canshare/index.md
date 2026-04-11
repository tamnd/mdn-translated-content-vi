---
title: "Navigator: phương thức canShare()"
short-title: canShare()
slug: Web/API/Navigator/canShare
page-type: web-api-instance-method
browser-compat: api.Navigator.canShare
---

{{APIRef("Web Share API")}}{{securecontext_header}}

Phương thức **`canShare()`** của giao diện {{domxref("Navigator")}} trả về `true` nếu lệnh gọi tương đương tới {{domxref("navigator.share()")}} thành công.

Phương thức trả về `false` nếu dữ liệu không thể _validated_. Những lý do khiến dữ liệu có thể không hợp lệ bao gồm:

- Tham số `data` đã bị bỏ qua hoặc chỉ chứa các thuộc tính có giá trị không xác định. Lưu ý rằng mọi thuộc tính không được tác nhân người dùng nhận ra sẽ bị bỏ qua.
- URL có định dạng sai.
- File được chỉ định nhưng việc triển khai không hỗ trợ chia sẻ file.
- Việc chia sẻ dữ liệu được chỉ định sẽ bị tác nhân người dùng coi là "chia sẻ thù địch".

[Web Share API](/en-US/docs/Web/API/Web_Share_API) được kiểm soát bởi chính sách cấp phép [web-share](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/web-share).
Phương thức `canShare()` sẽ trả về `false` nếu quyền được hỗ trợ nhưng chưa được cấp.

## Cú pháp

```js-nolint
canShare()
canShare(data)
```

### Thông số

- `data` {{optional_inline}}
  - : Đối tượng xác định dữ liệu chia sẻ để kiểm tra.
    Thông thường, một đối tượng có cùng thuộc tính sẽ được chuyển tới {{domxref("navigator.share()")}} nếu lệnh gọi này trả về `true`.

Các thuộc tính mà tác nhân người dùng không xác định sẽ bị bỏ qua; dữ liệu chia sẻ chỉ được đánh giá dựa trên các thuộc tính được tác nhân người dùng hiểu.
Tất cả các thuộc tính đều là tùy chọn nhưng phải chỉ định ít nhất một thuộc tính dữ liệu đã biết, nếu không phương thức sẽ trả về `false`.

Các giá trị có thể là: - `url` {{optional_inline}} - : Một chuỗi đại diện cho một URL được chia sẻ. - `text` {{optional_inline}} - : Một chuỗi đại diện cho văn bản được chia sẻ. - `title` {{optional_inline}} - : Một chuỗi đại diện cho tiêu đề được chia sẻ. - `files` {{optional_inline}} - : Một mảng các đối tượng {{domxref("File")}} đại diện cho các file sẽ được chia sẻ.

### Giá trị trả về

Trả về `true` nếu `data` được chỉ định có thể được chia sẻ với {{domxref("Navigator.share()")}}, nếu không thì `false`.

## Ví dụ

### Gửi URL MDN

Ví dụ sử dụng `navigator.canShare()` để kiểm tra xem `navigator.share()` có thể chia sẻ dữ liệu được chỉ định hay không.

#### HTML

HTML chỉ tạo một đoạn văn để hiển thị kết quả kiểm tra.

```html
<p class="result"></p>
```

#### JavaScript

```js
let shareData = {
  title: "MDN",
  text: "Learn web development on MDN!",
  url: "https://developer.mozilla.org",
};

const resultPara = document.querySelector(".result");

if (!navigator.canShare) {
  resultPara.textContent = "navigator.canShare() not supported.";
} else if (navigator.canShare(shareData)) {
  resultPara.textContent =
    "navigator.canShare() supported. We can use navigator.share() to send the data.";
} else {
  resultPara.textContent = "Specified data cannot be shared.";
}
```

#### Kết quả

Hộp bên dưới sẽ nêu rõ liệu `navigator.canShare()` có được hỗ trợ trên trình duyệt này hay không và nếu có thì chúng tôi có thể sử dụng `navigator.share()` để chia sẻ dữ liệu được chỉ định hay không:

{{EmbedLiveSample('Sending_the_MDN_URL')}}

### Ví dụ kiểm tra tính năng

Tính năng phương pháp này kiểm tra xem một thuộc tính dữ liệu cụ thể có hợp lệ và có thể chia sẻ được hay không.
Nếu được sử dụng với một thuộc tính `data` duy nhất, nó sẽ chỉ trả về `true` nếu thuộc tính đó hợp lệ và có thể được chia sẻ trên nền tảng.

Mã bên dưới minh họa việc xác minh rằng thuộc tính dữ liệu có được hỗ trợ hay không.

```js
// Feature that may not be supported
let testShare = { someNewProperty: "Data to share" };

// Complex data that uses new key
const shareData = {
  title: "MDN",
  text: "Learn web development on MDN!",
  url: "https://developer.mozilla.org",
  someNewProperty: "Data to share",
};

// Test that the key is valid and supported before sharing
if (navigator.canShare(testShare)) {
  // Use navigator.share() to share 'shareData'
} else {
  // Handle case that new data property can't be shared.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.share()")}}
