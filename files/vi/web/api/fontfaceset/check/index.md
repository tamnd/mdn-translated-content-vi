---
title: "FontFaceSet: phương thức check()"
short-title: check()
slug: Web/API/FontFaceSet/check
page-type: web-api-instance-method
browser-compat: api.FontFaceSet.check
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Phương thức `check()` của {{domxref("FontFaceSet")}} trả về `true` nếu bạn có thể render văn bản với font spec đã cho mà không cần dùng bất kỳ font nào trong `FontFaceSet` chưa tải hoàn toàn. Tức là có thể dùng font spec mà không gây ra [font swap](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-display).

> [!NOTE]
> Phương thức `check()` không được thiết kế để xác minh xem một kiểu font cụ thể có thể render hay một font cụ thể đã tải hoàn toàn chưa. Thay vào đó, nó trả về `true` nếu văn bản được chỉ định có thể render với font spec đã cho mà không gây font swap. Điều này có nghĩa là ngay cả khi font được yêu cầu không khả dụng hay chưa tải hoàn toàn, phương thức vẫn có thể trả về `true`. Hành vi này giúp tránh vấn đề về font swapping nhưng có thể gây nhầm lẫn nếu bạn đang cố xác nhận sự khả dụng của một font cụ thể.

## Cú pháp

```js-nolint
check(font)
check(font, text)
```

### Tham số

- `font`
  - : Đặc tả font theo cú pháp thuộc tính CSS {{cssxref("font")}}, ví dụ `"italic bold 16px Roboto"`
- `text`
  - : Giới hạn font face với những font có phạm vi Unicode chứa ít nhất một ký tự trong text. Điều này [không kiểm tra độ phủ glyph từng ký tự](https://lists.w3.org/Archives/Public/www-style/2015Aug/0330.html).

### Giá trị trả về

Giá trị {{jsxref("Boolean")}} là `true` nếu render văn bản với font spec đã cho sẽ không dùng bất kỳ font nào trong `FontFaceSet` chưa tải hoàn toàn.

Tức là tất cả font trong `FontFaceSet` khớp với font spec đã cho đều có thuộc tính [`status`](/en-US/docs/Web/API/FontFace/status) là `"loaded"`.

Ngược lại, hàm trả về `false`.

## Ví dụ

Trong ví dụ sau, ta tạo `FontFace` mới và thêm vào `FontFaceSet`:

```js
const font = new FontFace("molot", 'url("/shared-assets/fonts/molot.woff2")', {
  style: "normal",
  weight: "400",
  stretch: "condensed",
});

document.fonts.add(font);
```

### Font chưa tải

Font chưa tải, nên `check("12px molot")` trả về `false`, cho biết nếu dùng font spec này sẽ kích hoạt việc tải font:

```js
console.log(document.fonts.check("12px molot"));
// false: font khớp có trong tập hợp nhưng chưa tải
```

### Font hệ thống

Nếu chỉ dùng font hệ thống trong tham số `check()`, kết quả là `true` vì có thể dùng font hệ thống mà không cần tải gì từ tập hợp:

```js
console.log(document.fonts.check("12px Courier"));
// true: font khớp là font hệ thống
```

### Font không tồn tại

Nếu dùng font không có trong `FontFaceSet` và không phải font hệ thống, `check()` trả về `true` vì trong trường hợp này không cần dùng font nào từ tập hợp:

```js
console.log(document.fonts.check("12px i-dont-exist"));
// true: font khớp là font không tồn tại
```

### Font hệ thống và font chưa tải

Nếu dùng cả font hệ thống và font trong tập hợp chưa tải, `check()` trả về `false`:

```js
console.log(document.fonts.check("12px molot, Courier"));
// false: `molot` có trong tập hợp nhưng chưa tải
```

### Font đang tải

Nếu dùng font đang trong quá trình tải, `check()` trả về `false`:

```js
function check() {
  font.load();
  console.log(document.fonts.check("12px molot"));
  // false: font vẫn đang tải
  console.log(font.status);
  // "loading"
}

check();
```

### Font đã tải xong

Nếu dùng font đã tải xong, `check()` trả về `true`:

```js
async function check() {
  await font.load();
  console.log(document.fonts.check("12px molot"));
  // true: font đã tải xong
  console.log(font.status);
  // "loaded"
}

check();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
