---
title: Base64
slug: Glossary/Base64
page-type: glossary-definition
sidebar: glossarysidebar
---

**Base64** là một nhóm các lược đồ [mã hóa nhị phân sang văn bản](https://en.wikipedia.org/wiki/Binary-to-text_encoding) tương tự nhau, đại diện cho dữ liệu nhị phân ở định dạng chuỗi {{glossary("ASCII")}} bằng cách chuyển đổi nó thành biểu diễn cơ số 64. Thuật ngữ _Base64_ bắt nguồn từ một [mã hóa truyền nội dung MIME](https://en.wikipedia.org/wiki/MIME#Content-Transfer-Encoding) cụ thể.

Các lược đồ mã hóa Base64 thường được sử dụng để mã hóa dữ liệu nhị phân để lưu trữ hoặc truyền qua phương tiện chỉ có thể xử lý văn bản ASCII (hoặc một tập hợp siêu của ASCII nhưng vẫn không thể chấp nhận dữ liệu nhị phân tùy ý). Điều này đảm bảo rằng dữ liệu vẫn còn nguyên vẹn mà không bị sửa đổi trong quá trình vận chuyển. Các ứng dụng phổ biến của Base64 bao gồm:

- Email qua [MIME](https://en.wikipedia.org/wiki/MIME)
- Lưu trữ dữ liệu phức tạp trong [XML](/en-US/docs/Web/XML)
- Mã hóa dữ liệu nhị phân để có thể được đưa vào một [`data:` URL](/en-US/docs/Web/URI/Reference/Schemes/data)

## Ký tự Base64

Khi thuật ngữ "Base64" được sử dụng một mình để chỉ một {{glossary("algorithm", "thuật toán")}} cụ thể, nó thường đề cập đến phiên bản Base64 được nêu trong {{rfc("4648", "", 4)}}, sử dụng bảng chữ cái sau để đại diện cho các chữ số cơ số 64, cùng với `=` là ký tự đệm:

```plain
ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/
```

## Base64 an toàn cho URL và tên tệp

Một biến thể phổ biến của định nghĩa này chỉ cho phép các ký tự an toàn để sử dụng trong tên tệp và giá trị {{glossary("URL")}}. Phiên bản này, được định nghĩa trong {{rfc("4648", "", 5)}}, bỏ qua phần đệm và thay thế `+` và `/` bằng `-` và `_`.

Bạn không cần mã hóa này nếu không đặt dữ liệu vào một phân đoạn đường dẫn hoặc tham số truy vấn — ví dụ, [data URLs](/en-US/docs/Web/URI/Reference/Schemes/data) không có cái nào trong số đó và có thể sử dụng mã hóa Base64 tiêu chuẩn.

## Tăng kích thước được mã hóa

Mỗi chữ số Base64 đại diện cho 6 bit dữ liệu (64 = 2<sup>6</sup>). Vì vậy, ba byte 8-bit của chuỗi đầu vào/tệp nhị phân (3×8 bit = 24 bit) có thể được đại diện bởi bốn chữ số Base64 6-bit (4×6 = 24 bit).

Điều này có nghĩa là phiên bản Base64 của một chuỗi hoặc tệp thường lớn hơn khoảng một phần ba so với nguồn (kích thước tăng chính xác phụ thuộc vào nhiều yếu tố, chẳng hạn độ dài tuyệt đối của chuỗi, độ dài của nó modulo 3 và liệu ký tự đệm có được sử dụng hay không).

## Phần cuối

Chuỗi base64 có thể được phân chia thành các khối 4 ký tự, trong đó khối cuối cùng có thể có ít hơn 4 ký tự. Khối cuối cùng có thể được đệm bằng ký tự `=` để đúng 4 ký tự. Không tính ký tự đệm, khối cuối cùng có thể là một trong những trường hợp sau:

- 2 ký tự: mã hóa 12 bit đại diện cho 1 byte (8 bit) dữ liệu
- 3 ký tự: mã hóa 18 bit đại diện cho 2 byte (16 bit) dữ liệu
- 4 ký tự: mã hóa 24 bit đại diện cho 3 byte (24 bit) dữ liệu

Trong hai trường hợp đầu tiên, các ký tự có thể có 4 hoặc 2 bit đuôi thêm không đại diện cho bất kỳ dữ liệu nào. Trong trường hợp này, [RFC 4648](https://datatracker.ietf.org/doc/html/rfc4648#section-3.5) yêu cầu bộ mã hóa đặt các bit này thành 0 và bộ giải mã tùy chọn ném lỗi nếu chúng không phải 0. Ví dụ, nếu dữ liệu được mã hóa là một byte duy nhất `0b01010101`, thì cần hai ký tự `0b010101` (`V`) và `0b010000` (`Q`), trong đó ký tự thứ hai có 4 bit đuôi được đặt thành 0. Giải mã `VR==` (trong đó ký tự thứ hai đại diện cho `0b010001`) về mặt kỹ thuật dẫn đến cùng byte `0b01010101`, nhưng bộ giải mã có thể ném lỗi do các bit đuôi không phải 0.

## Hỗ trợ JavaScript

Lớp {{jsxref("Uint8Array")}} cung cấp các phương thức {{jsxref("Uint8Array.fromBase64()")}}, {{jsxref("Uint8Array.prototype.toBase64()")}} và {{jsxref("Uint8Array.prototype.setFromBase64()")}} để chuyển đổi sang/từ chuỗi base64.

Trình duyệt cũng cung cấp sẵn hai hàm JavaScript để giải mã và mã hóa chuỗi Base64:

- {{domxref("Window.btoa()")}} (cũng {{domxref("WorkerGlobalScope.btoa()", "có trong worker", "", "nocode")}}): tạo chuỗi ASCII được mã hóa Base64 từ chuỗi dữ liệu nhị phân ("btoa" nên đọc là "binary to ASCII").
- {{domxref("Window.atob()")}} (cũng {{domxref("WorkerGlobalScope.atob()", "có trong worker", "", "nocode")}}): giải mã chuỗi được mã hóa Base64 ("atob" nên đọc là "ASCII to binary").

> [!NOTE]
> Base64 là mã hóa nhị phân chứ không phải mã hóa văn bản, nhưng `btoa` và `atob` đã được thêm vào nền tảng web trước khi nó hỗ trợ các kiểu dữ liệu nhị phân. Do đó, hai hàm này sử dụng chuỗi để đại diện cho dữ liệu nhị phân, với {{glossary("code point", "điểm mã")}} của mỗi ký tự đại diện cho giá trị của mỗi byte. Điều này đã dẫn đến một hiểu lầm phổ biến rằng `btoa` có thể được sử dụng để mã hóa dữ liệu văn bản tùy ý — ví dụ, tạo `data:` URL Base64 của tài liệu văn bản hoặc HTML.
>
> Tuy nhiên, sự tương ứng byte-với-điểm-mã chỉ đáng tin cậy cho các điểm mã đến `0x7f`. Hơn nữa, các điểm mã trên `0xff` sẽ khiến `btoa` ném lỗi do vượt quá giá trị tối đa cho 1 byte. Phần "[Unicode strings](/en-US/docs/Web/API/Window/btoa#unicode_strings)" của {{domxref("Window.btoa()")}} mô tả chi tiết cách xử lý giới hạn này khi mã hóa văn bản Unicode tùy ý.

## Xem thêm

- Các API JavaScript:
  - {{domxref("Window.atob()")}} (cũng {{domxref("WorkerGlobalScope.atob()", "có trong worker", "", "nocode")}})
  - {{domxref("Window.btoa()")}} (cũng {{domxref("WorkerGlobalScope.btoa()", "có trong worker", "", "nocode")}})
  - {{jsxref("Uint8Array")}}
- [Data URLs](/en-US/docs/Web/URI/Reference/Schemes/data)
- [Base64](https://en.wikipedia.org/wiki/Base64) trên Wikipedia
- Thuật toán Base64 được mô tả trong [RFC 4648](https://datatracker.ietf.org/doc/html/rfc4648)
