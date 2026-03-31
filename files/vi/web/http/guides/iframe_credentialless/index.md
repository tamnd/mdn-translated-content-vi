---
title: IFrame credentialless
slug: Web/HTTP/Guides/IFrame_credentialless
page-type: guide
status:
  - experimental
browser-compat: html.elements.iframe.credentialless
spec-urls: https://wicg.github.io/anonymous-iframe/
sidebar: http
---

{{SeeCompatTable}}

**IFrame credentialless** cung cấp cơ chế để các nhà phát triển tải tài nguyên của bên thứ ba trong {{htmlelement("iframe")}} bằng cách sử dụng ngữ cảnh mới, tạm thời. Nó không có quyền truy cập vào mạng, cookie và dữ liệu lưu trữ thông thường của nguồn gốc của nó. Nó sử dụng ngữ cảnh mới cục bộ với thời gian sống của tài liệu cấp cao nhất. Đổi lại, các quy tắc nhúng {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) có thể được dỡ bỏ, vì vậy các tài liệu có COEP được đặt có thể nhúng các tài liệu của bên thứ ba không có COEP.

## Vấn đề

Nhiều tính năng API web chỉ có thể được sử dụng trên các trang web chọn tham gia cross-origin isolation — ví dụ bao gồm {{jsxref("SharedArrayBuffer")}} và {{domxref("DOMHighResTimeStamp", "high-resolution timers", "", "nocode")}}. Điều này là do rủi ro các tính năng đó bị khai thác trong [các cuộc tấn công Spectre](https://spectreattack.com/spectre.pdf), nơi thông tin bí mật của nạn nhân có thể bị rò rỉ qua kênh bên và bị kẻ tấn công nắm bắt.

Để chọn tham gia cross-origin isolation, tài nguyên phải được phục vụ với {{httpheader("Cross-Origin-Opener-Policy")}} có giá trị `same-origin` (bảo vệ nguồn gốc của bạn khỏi kẻ tấn công) và {{httpheader("Cross-Origin-Embedder-Policy")}} có giá trị `credentialless` hoặc `require-corp` (bảo vệ nạn nhân khỏi nguồn gốc của bạn). Cái sau ngăn tài liệu tải bất kỳ tài nguyên xuyên nguồn gốc có thông tin xác thực nào không cấp cho tài liệu quyền rõ ràng bằng cách sử dụng {{httpheader("Cross-Origin-Resource-Policy")}} hoặc [Cross-Origin Resource Sharing](/en-US/docs/Web/HTTP/Guides/CORS).

Vấn đề chính hạn chế việc áp dụng cross-origin isolation là thực tế `Cross-Origin-Embedder-Policy` được áp dụng đệ quy — bất kỳ nội dung của bên thứ ba nào được tải vào `<iframe>` trong tài liệu có `Cross-Origin-Embedder-Policy` được đặt cũng phải triển khai `Cross-Origin-Embedder-Policy` để việc nhúng thành công. Đây là vấn đề cho các nhà phát triển nhúng nội dung của bên thứ ba trong các ứng dụng của họ (như nội dung ad-network) vì nói chung họ không có quyền kiểm soát nó — lựa chọn duy nhất của họ cho đến nay là chờ các nhà cung cấp nội dung của bên thứ ba triển khai `Cross-Origin-Embedder-Policy`.

Vấn đề này có thể được giải quyết bởi IFrame credentialless.

## Giải pháp — Iframe credentialless

`<iframe>` được tạo thành credentialless bằng cách áp dụng thuộc tính [`credentialless`](/en-US/docs/Web/HTML/Reference/Elements/iframe#credentialless) cho nó hoặc đặt thuộc tính DOM tương đương — {{domxref("HTMLIFrameElement.credentialless")}} — thành `true`.

```html
<iframe
  src="https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)"
  title="Spectre vulnerability Wikipedia page"
  width="960"
  height="600"
  credentialless></iframe>
```

Hoặc:

```html
<iframe width="960" height="600"> </iframe>
```

```js
const iframeElem = document.querySelector("iframe");

iframeElem.credentialless = true;
iframeElem.title = "Spectre vulnerability Wikipedia page";
iframeElem.src =
  "https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)";
```

> [!NOTE]
> Thuộc tính {{domxref("window.credentialless")}} có thể được truy vấn bởi tài liệu được nhúng trong `<iframe>` để kiểm tra xem nó có đang chạy trong ngữ cảnh credentialless hay không. Giá trị `true` có nghĩa là `<iframe>` nhúng là credentialless.

Kết quả là các tài liệu bên trong `<iframe>` credentialless được tải bằng cách sử dụng các ngữ cảnh mới, tạm thời — những ngữ cảnh đó không có quyền truy cập vào dữ liệu liên quan đến nguồn gốc của chúng; ví dụ [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) và [localStorage](/en-US/docs/Web/API/Window/localStorage). Bộ nhớ credentialless được phân vùng riêng với các khóa lưu trữ được sửa đổi bởi giá trị {{Glossary("Nonce", "nonce")}} ("number used once"), được đặt một lần cho mỗi tài liệu cấp cao nhất. Vì vậy, cookie được đặt trong một `<iframe>` credentialless sẽ chỉ có thể truy cập từ các `<iframe>` credentialless cùng nguồn gốc được nhúng bên dưới cùng tài liệu cấp cao nhất.

Nonce được chia sẻ cho mỗi iframe credentialless là con cháu của cùng tài liệu cấp cao nhất, nhưng nó khác nhau cho mỗi tài liệu cấp cao nhất riêng biệt mà người dùng điều hướng đến, và không còn có thể truy cập sau khi người dùng đã điều hướng đi. IFrame credentialless không chia sẻ bộ nhớ qua các trang khác nhau. Quay lại cookie đã đề cập ở trên, tải lại tài liệu sẽ tải các `<iframe>` credentialless trong ngữ cảnh khác, vì vậy không có cookie nào đã được đặt trước đó sẽ có sẵn.

Ngoài ra:

- Pop-up được mở bởi iframe credentialless được mở với [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) được đặt. Điều này ngăn các luồng OAuth pop-up được sử dụng trong iframe credentialless.
- Chức năng tự động điền của trình duyệt hoặc trình quản lý mật khẩu không có sẵn trong `<iframe>` credentialless.

Kết quả là các tài liệu được tải vào `<iframe>` credentialless thực sự là các phiên bản vanilla hoặc "công khai", không được tùy chỉnh với bất kỳ thông tin nhạy cảm nào của người dùng. Vì không có thông tin nhạy cảm nào có sẵn để rò rỉ từ các tài liệu này, chúng không có giá trị đối với các kẻ tấn công tiềm năng, và do đó yêu cầu Cross-Origin Embedder Policy được bỏ qua cho những IFrame đó.

## Credentialless đệ quy bên trong IFrame con

Nếu `credentialless` được đặt trên `<iframe>` có các `<iframe>` con được nhúng trong tài liệu được tải bên trong nó, những `<iframe>` con đó kế thừa cài đặt credentialless.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Cross-Origin-Opener-Policy")}}
- {{httpheader("Cross-Origin-Embedder-Policy")}}
- {{httpheader("Cross-Origin-Resource-Policy")}}
- [Cross-Origin Resource Sharing](/en-US/docs/Web/HTTP/Guides/CORS)
- Thuộc tính [`credentialless`](/en-US/docs/Web/HTML/Reference/Elements/iframe#credentialless) của `<iframe>`
- {{domxref("HTMLIFrameElement.credentialless")}}
