---
title: Local Font Access API
slug: Web/API/Local_Font_Access_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Window.queryLocalFonts
spec-urls: https://wicg.github.io/local-font-access/
---

{{SeeCompatTable}}{{DefaultAPISidebar("Local Font Access API")}}

**Local Font Access API** cung cấp một cơ chế để truy cập dữ liệu phông chữ được cài đặt cục bộ trên máy người dùng. Điều này bao gồm các chi tiết cấp cao hơn như tên, kiểu và họ phông, cũng như các byte thô của tệp phông chữ nền.

## Khái niệm và cách dùng

[Web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts) đã tạo ra một bước tiến lớn trong việc cho phép kiểu chữ trên web, bằng cách cho phép nhà thiết kế web cung cấp phông chữ tùy chỉnh để dùng trong tài liệu web. Được xác định qua at-rule {{cssxref("@font-face")}}, một web font có thể được tải từ URL được cung cấp trong hàm `url()`.

`@font-face` còn có nhiều tính năng hữu ích khác. Đặc biệt, bạn cũng có thể chỉ định tên đầy đủ hoặc tên Postscript của phông trong hàm `local()` để báo cho trình duyệt dùng bản sao cục bộ nếu người dùng đã cài phông đó trên máy tính của họ. Tuy nhiên, điều này không phải không có vấn đề - `local()` đã trở nên nổi tiếng như một [vector lấy dấu vân tay](https://developer.chrome.com/docs/capabilities/web-apis/local-fonts#local_fonts_as_fingerprint_vector).

Ngoài ra, các công cụ thiết kế cao cấp từ trước đến nay thường khó triển khai trên web, do gặp khó khăn trong việc liệt kê phông chính xác và truy cập dữ liệu phông ở mức thấp hơn, chẳng hạn để áp dụng bộ lọc và biến đổi. Các ứng dụng hiện nay thường phải dùng các giải pháp thay thế như yêu cầu người dùng tải phông của họ lên một máy chủ để xử lý nhằm lấy dữ liệu byte thô, hoặc cài một chương trình cục bộ riêng để cung cấp thêm khả năng.

Local Font Access API được tạo ra để giải quyết những vấn đề này.

Phương thức {{domxref("Window.queryLocalFonts()")}} cung cấp quyền truy cập vào một mảng các phông đã cài đặt cục bộ, mỗi phông được biểu diễn bởi một thể hiện {{domxref("FontData")}}. {{domxref("FontData")}} có một số thuộc tính cung cấp quyền truy cập vào tên, kiểu và họ phông, đồng thời cũng có phương thức {{domxref("FontData.blob", "blob()")}} cung cấp quyền truy cập vào một {{domxref("Blob")}} chứa các byte thô của tệp phông nền.

Về quyền riêng tư và bảo mật:

- Local Font Access API chỉ được thiết kế để cung cấp quyền truy cập vào dữ liệu cần thiết nhằm giải quyết các vấn đề nêu trên. Trình duyệt cũng không bắt buộc phải cung cấp toàn bộ danh sách phông cục bộ sẵn có, cũng như không bắt buộc phải cung cấp dữ liệu theo cùng thứ tự như trên đĩa.
- Khi gọi {{domxref("Window.queryLocalFonts()")}}, người dùng sẽ được hỏi quyền truy cập vào các phông cục bộ của họ. Trạng thái của quyền này có thể được truy vấn qua [Permissions API](/en-US/docs/Web/API/Permissions_API) (quyền `local-fonts`).
- Bạn có thể kiểm soát quyền truy cập vào tính năng này bằng một chính sách [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader("Permissions-Policy/local-fonts", "local-fonts")}}.

## Giao diện

- {{domxref("FontData")}}
  - : Đại diện cho một mặt phông cục bộ duy nhất.

## Mở rộng cho các giao diện khác

- {{domxref("Window.queryLocalFonts()")}}
  - : Trả về một {{jsxref("Promise")}} được hoàn tất với một mảng các đối tượng {{domxref("FontData")}} đại diện cho các mặt phông có sẵn cục bộ.

## Ví dụ

Để xem bản demo trực tiếp hoạt động, hãy xem [demo Local Font Access API](https://mdn.github.io/dom-examples/local-font-access/).

### Phát hiện tính năng

```js
if ("queryLocalFonts" in window) {
  // Local Font Access API được hỗ trợ
}
```

### Liệt kê phông

Đoạn mã sau sẽ truy vấn tất cả các phông có sẵn và ghi lại siêu dữ liệu. Ví dụ này có thể được dùng để điền dữ liệu cho một điều khiển chọn phông.

```js
async function logFontData() {
  try {
    const availableFonts = await window.queryLocalFonts();
    for (const fontData of availableFonts) {
      console.log(fontData.postscriptName);
      console.log(fontData.fullName);
      console.log(fontData.family);
      console.log(fontData.style);
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

### Truy cập dữ liệu cấp thấp

Phương thức {{domxref("FontData.blob", "blob()")}} cung cấp quyền truy cập vào dữ liệu [SFNT](https://en.wikipedia.org/wiki/SFNT) cấp thấp - đây là một định dạng tệp phông có thể chứa các định dạng phông khác, như PostScript, TrueType, OpenType hoặc Web Open Font Format (WOFF).

```js
async function computeOutlineFormat() {
  try {
    const availableFonts = await window.queryLocalFonts({
      postscriptNames: ["ComicSansMS"],
    });
    for (const fontData of availableFonts) {
      // `blob()` trả về một Blob chứa dữ liệu phông hợp lệ và đầy đủ
      // được bao bọc theo SFNT.
      const sfnt = await fontData.blob();
      // Chỉ lấy các byte cần thiết: 4 byte đầu tiên là thông tin
      // phiên bản SFNT.
      // Đặc tả: https://learn.microsoft.com/en-us/typography/opentype/spec/otff#organization-of-an-opentype-font
      const sfntVersion = await sfnt.slice(0, 4).text();

      let outlineFormat = "UNKNOWN";
      switch (sfntVersion) {
        case "\x00\x01\x00\x00":
        case "true":
        case "typ1":
          outlineFormat = "truetype";
          break;
        case "OTTO":
          outlineFormat = "cff";
          break;
      }
      console.log("Định dạng outline:", outlineFormat);
    }
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Use advanced typography with local fonts](https://developer.chrome.com/docs/capabilities/web-apis/local-fonts)
- {{cssxref("@font-face")}}
- Chỉ thị {{httpheader("Permissions-Policy/local-fonts", "local-fonts")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
