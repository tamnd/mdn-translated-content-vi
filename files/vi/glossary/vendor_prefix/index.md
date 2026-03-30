---
title: Tiền tố nhà cung cấp
slug: Glossary/Vendor_Prefix
page-type: glossary-definition
sidebar: glossarysidebar
---

Các nhà cung cấp trình duyệt từng thêm tiền tố vào các thuộc tính CSS thử nghiệm hoặc không theo tiêu chuẩn và các JavaScript API để các nhà phát triển có thể thử nghiệm các ý tưởng mới. Về lý thuyết, điều này giúp ngăn chặn việc các thử nghiệm của họ bị phụ thuộc vào và sau đó gây ra lỗi trong mã của nhà phát triển web trong quá trình chuẩn hóa.

Các nhà phát triển web đã đưa các tính năng có tiền tố vào các trang web sản xuất, bất chấp tính chất thử nghiệm của chúng. Điều này khiến các nhà cung cấp trình duyệt khó đảm bảo tính tương thích hơn khi làm việc trên các tính năng mới. Việc bao gồm các tính năng có tiền tố cũng gây hại cho các nhà cung cấp trình duyệt nhỏ hơn, những người cuối cùng phải thêm tiền tố của các trình duyệt khác để hiển thị các trang web phổ biến.

Hiện nay, các tính năng thử nghiệm trong trình duyệt được "đặt sau cờ" (put behind a flag). Điều này cho phép các nhà phát triển thay đổi cấu hình trình duyệt để kiểm tra các tính năng sắp tới. Trình duyệt hiện thêm các tính năng thử nghiệm sau các cờ hoặc tùy chọn do người dùng kiểm soát. Các cờ có thể được thêm cho các đặc tả nhỏ hơn giúp đạt trạng thái ổn định nhanh hơn nhiều.

## Tiền tố CSS

Các tiền tố CSS trình duyệt phổ biến nhất mà bạn sẽ thấy trong các codebase cũ bao gồm:

- `-webkit-` (Chrome, Safari, các phiên bản mới hơn của Opera và Edge, hầu hết các trình duyệt iOS bao gồm Firefox cho iOS; về cơ bản là bất kỳ trình duyệt dựa trên WebKit hoặc Chromium)
- `-moz-` (Firefox)
- `-o-` (các phiên bản Opera cũ trước WebKit)
- `-ms-` (Internet Explorer và Microsoft Edge, trước Chromium)

Ví dụ sử dụng:

```css
-webkit-transition: all 4s ease;
-moz-transition: all 4s ease;
-ms-transition: all 4s ease;
-o-transition: all 4s ease;
transition: all 4s ease;
```

Nếu bạn gặp đoạn mã trên trong một codebase, bạn có thể xóa an toàn tất cả các dòng trừ dòng cuối cùng. Tất cả các trình duyệt đều hỗ trợ [transitions](/en-US/docs/Web/CSS/Reference/Properties/transition#browser_compatibility) mà không cần tiền tố nhà cung cấp:

```css
transition: all 4s ease;
```

## Tiền tố API

Trong lịch sử, các nhà cung cấp trình duyệt cũng đã sử dụng tiền tố cho các API thử nghiệm. Nếu toàn bộ một giao diện là thử nghiệm, thì tên giao diện được thêm tiền tố (nhưng không phải các thuộc tính hay phương thức bên trong). Nếu một thuộc tính hoặc phương thức thử nghiệm được thêm vào một giao diện đã được chuẩn hóa, thì phương thức hoặc thuộc tính riêng lẻ đó được thêm tiền tố.

### Tiền tố giao diện

Tiền tố cho tên giao diện được viết hoa:

- `WebKit` (Chrome, Safari, các phiên bản mới hơn của Opera và Edge, hầu hết các trình duyệt iOS (bao gồm Firefox cho iOS); về cơ bản là bất kỳ trình duyệt dựa trên WebKit và Chromium)
- `Moz` (Firefox)
- `O` (Các phiên bản Opera cũ hơn, trước WebKit)
- `MS` (Internet Explorer và Microsoft Edge, trước Chromium)

### Tiền tố thuộc tính và phương thức

Tiền tố cho thuộc tính và phương thức được viết thường:

- `webkit` (Chrome, Safari, các phiên bản mới hơn của Opera và Edge, hầu hết các trình duyệt iOS (bao gồm Firefox cho iOS); về cơ bản là bất kỳ trình duyệt dựa trên WebKit và Chromium)
- `moz` (Firefox)
- `o` (Các phiên bản Opera cũ, trước WebKit)
- `ms` (Internet Explorer và Microsoft Edge, trước Chromium)

Ví dụ sử dụng:

```js
window.requestAnimationFrame =
  window.requestAnimationFrame ||
  window.mozRequestAnimationFrame ||
  window.webkitRequestAnimationFrame ||
  window.oRequestAnimationFrame ||
  window.msRequestAnimationFrame;
```

Nếu bạn gặp đoạn mã trên trong một codebase, bạn có thể xóa an toàn tất cả trừ dòng đầu tiên. Tất cả các trình duyệt đều hỗ trợ [`requestAnimationFrame`](/en-US/docs/Web/API/Window/requestAnimationFrame#browser_compatibility) mà không cần tiền tố nhà cung cấp và không cần `window`:

```js
requestAnimationFrame(callback);
```

## Xem thêm

- [Các phần mở rộng CSS có tiền tố `-moz-` của nhà cung cấp](/en-US/docs/Web/CSS/Reference/Mozilla_extensions)
- [Các phần mở rộng CSS có tiền tố `-webkit-` của nhà cung cấp](/en-US/docs/Web/CSS/Reference/Webkit_extensions)
- [Browser prefixes](https://en.wikipedia.org/wiki/CSS_hack#Browser_prefixes) trên Wikipedia
