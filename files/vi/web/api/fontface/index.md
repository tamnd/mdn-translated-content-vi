---
title: FontFace
slug: Web/API/FontFace
page-type: web-api-interface
browser-compat: api.FontFace
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Giao diện **`FontFace`** thuộc [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API) đại diện cho một font face có thể sử dụng được.

Giao diện này xác định nguồn của font face, có thể là URL tới tài nguyên bên ngoài hoặc một buffer, cùng các thuộc tính font như `style`, `weight`, v.v. Với nguồn là URL, nó cho phép tác giả kích hoạt việc tải font từ xa và theo dõi trạng thái tải.

## Hàm khởi tạo

- {{domxref("FontFace.FontFace", "FontFace()")}}
  - : Tạo và trả về đối tượng `FontFace` mới, được xây dựng từ tài nguyên bên ngoài qua URL hoặc từ {{jsxref("ArrayBuffer")}}.

## Thuộc tính phiên bản

- {{domxref("FontFace.ascentOverride")}}
  - : Chuỗi dùng để lấy hoặc đặt _chỉ số ascent_ của font. Tương đương với descriptor {{cssxref("@font-face/ascent-override", "ascent-override")}}.
- {{domxref("FontFace.descentOverride")}}
  - : Chuỗi dùng để lấy hoặc đặt _chỉ số descent_ của font. Tương đương với descriptor {{cssxref("@font-face/descent-override", "descent-override")}}.
- {{domxref("FontFace.display")}}
  - : Chuỗi xác định cách hiển thị font face dựa trên việc nó đã được tải về và sẵn sàng dùng chưa.
- {{domxref("FontFace.family")}}
  - : Chuỗi dùng để lấy hoặc đặt _họ_ của font. Tương đương với descriptor {{cssxref("@font-face/font-family", "font-family")}}.
- {{domxref("FontFace.featureSettings")}}
  - : Chuỗi dùng để lấy hoặc đặt các tính năng font ít dùng không có sẵn từ các thuộc tính variant của font. Tương đương với thuộc tính CSS {{cssxref("font-feature-settings")}}.
- {{domxref("FontFace.lineGapOverride")}}
  - : Chuỗi dùng để lấy hoặc đặt _chỉ số line-gap_ của font. Tương đương với descriptor {{cssxref("@font-face/line-gap-override", "line-gap-override")}}.
- {{domxref("FontFace.loaded")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("Promise")}} resolve với đối tượng `FontFace` hiện tại khi font được chỉ định trong constructor xong tải, hoặc reject với `SyntaxError` {{domxref("DOMException")}}.
- {{domxref("FontFace.status")}} {{ReadOnlyInline}}
  - : Trả về giá trị liệt kê cho biết trạng thái của font, một trong: `"unloaded"`, `"loading"`, `"loaded"`, hoặc `"error"`.
- {{domxref("FontFace.stretch")}}
  - : Chuỗi dùng để lấy hoặc đặt cách font _co giãn_. Tương đương với descriptor {{cssxref("@font-face/font-stretch", "font-stretch")}}.
- {{domxref("FontFace.style")}}
  - : Chuỗi dùng để lấy hoặc đặt _kiểu_ của font. Tương đương với descriptor {{cssxref("@font-face/font-style", "font-style")}}.
- {{domxref("FontFace.unicodeRange")}}
  - : Chuỗi dùng để lấy hoặc đặt _phạm vi code point unicode_ của font. Tương đương với descriptor {{cssxref("@font-face/unicode-range", "unicode-range")}}.
- {{domxref("FontFace.variant")}} {{non-standard_inline}}
  - : Chuỗi dùng để lấy hoặc đặt _biến thể_ của font.
- {{domxref("FontFace.variationSettings")}}
  - : Chuỗi dùng để lấy hoặc đặt _cài đặt biến thể_ của font. Tương đương với descriptor {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}.
- {{domxref("FontFace.weight")}}
  - : Chuỗi chứa _độ đậm_ của font. Tương đương với descriptor {{cssxref("@font-face/font-weight", "font-weight")}}.
- {{domxref("FontFace.load()")}}
  - : Tải font dựa trên yêu cầu được truyền vào constructor, bao gồm vị trí hoặc source buffer, và trả về {{jsxref('Promise')}} resolve với đối tượng FontFace hiện tại.

## Ví dụ

Đoạn mã dưới đây định nghĩa font face dùng dữ liệu tại URL "my-font.woff" với một vài descriptor. Để minh họa, ta đặt descriptor `stretch` bằng thuộc tính.

```js
// Định nghĩa FontFace
const font = new FontFace("my-font", 'url("my-font.woff")', {
  style: "italic",
  weight: "400",
});

font.stretch = "condensed";
```

Tiếp theo, tải font bằng {{domxref("FontFace.load()")}} và dùng promise trả về để theo dõi kết quả hoặc báo lỗi.

```js
// Tải font
font.load().then(
  () => {
    // Đã hoàn thành - thêm font vào document.fonts
  },
  (err) => {
    console.error(err);
  },
);
```

Để thực sự _dùng_ font, cần thêm nó vào {{domxref("FontFaceSet")}}. Có thể làm trước hoặc sau khi tải font.

Xem thêm ví dụ tại [CSS Font Loading API > Ví dụ](/en-US/docs/Web/API/CSS_Font_Loading_API#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face")}}
