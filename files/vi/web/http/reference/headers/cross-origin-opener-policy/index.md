---
title: Cross-Origin-Opener-Policy (COOP) header
short-title: Cross-Origin-Opener-Policy
slug: Web/HTTP/Reference/Headers/Cross-Origin-Opener-Policy
page-type: http-header
browser-compat: http.headers.Cross-Origin-Opener-Policy
sidebar: http
---

Tiêu đề HTTP **`Cross-Origin-Opener-Policy`** (COOP) {{glossary("response header")}} cho phép một trang web kiểm soát xem tài liệu cấp cao mới, được mở bằng {{domxref("Window.open()")}} hoặc bằng cách điều hướng đến trang mới, có được mở trong cùng {{glossary("Browsing context","nhóm ngữ cảnh duyệt web")}} (BCG) hay trong nhóm ngữ cảnh duyệt web mới.

Khi được mở trong BCG mới, bất kỳ tham chiếu nào giữa tài liệu mới và trình mở của nó đều bị cắt đứt, và tài liệu mới có thể được cách ly tiến trình khỏi trình mở của nó.
Điều này đảm bảo rằng những kẻ tấn công tiềm năng không thể mở tài liệu của bạn bằng {{domxref("Window.open()")}} và sau đó sử dụng giá trị trả về để truy cập đối tượng toàn cục của nó, từ đó ngăn chặn một loạt các tấn công khác nguồn gốc được gọi là [XS-Leaks](https://xsleaks.dev/).

Điều này cũng có nghĩa là bất kỳ đối tượng nào được tài liệu của bạn mở trong BCG mới sẽ không thể truy cập nó bằng [`window.opener`](/en-US/docs/Web/API/Window/opener).
Điều này cho phép bạn có nhiều kiểm soát hơn đối với các tham chiếu đến cửa sổ so với [`rel=noopener`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener), ảnh hưởng đến các điều hướng đi nhưng không ảnh hưởng đến các tài liệu được mở bằng {{domxref("Window.open()")}}.

Hành vi phụ thuộc vào các chính sách của cả tài liệu mới và trình mở của nó, và liệu tài liệu mới có được mở theo sau điều hướng hay bằng {{domxref("Window.open()")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Cross-Origin-Opener-Policy: unsafe-none
Cross-Origin-Opener-Policy: same-origin-allow-popups
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Opener-Policy: noopener-allow-popups
```

### Chỉ thị

- `unsafe-none`
  - : Tài liệu cho phép chia sẻ nhóm ngữ cảnh duyệt web của nó với bất kỳ tài liệu nào khác, và do đó có thể không an toàn.
    Nó được sử dụng để từ chối sử dụng COOP cho cách ly tiến trình.
    Đây là giá trị mặc định.

    Khi điều hướng, các tài liệu có `unsafe-none` sẽ luôn mở và được mở vào BCG mới — trừ khi tài liệu kia cũng có `unsafe-none` (hoặc không có giá trị chỉ thị COOP).

    Khi sử dụng `Window.open()`, các tài liệu có `unsafe-none` sẽ luôn mở các tài liệu có bất kỳ giá trị nào khác vào BCG mới.
    Tuy nhiên, các tài liệu có `unsafe-none` có thể được mở trong cùng BCG nếu trình mở có chỉ thị `same-origin-allow-popups`, `noopener-allow-popups`, hoặc `unsafe-none`.
    Một tài liệu có `same-origin` sẽ luôn mở tài liệu có `unsafe-none` trong BCG mới.

- `same-origin`
  - : Tài liệu cho phép tải vào BCG sử dụng COOP và chỉ chứa các tài liệu cùng nguồn gốc.
    Điều này được sử dụng để cung cấp [cách ly khác nguồn gốc](/en-US/docs/Web/API/Window/crossOriginIsolated) cho BCG.

    Các tài liệu có `same-origin` chỉ mở và được mở trong cùng BCG nếu cả hai tài liệu đều cùng nguồn gốc và có chỉ thị `same-origin`.

- `same-origin-allow-popups`
  - : Tương tự như chỉ thị [`same-origin`](#same-origin), ngoại trừ cho phép mở các tài liệu bằng {{domxref("Window.open()")}} trong cùng BCG nếu chúng có giá trị COOP là `unsafe-none`.

    Chỉ thị được sử dụng để nới lỏng hạn chế `same-origin` cho các tích hợp mà tài liệu cần lợi ích của cách ly khác nguồn gốc nhưng cũng cần mở và giữ tham chiếu đến các tài liệu khác nguồn gốc đáng tin cậy.
    Ví dụ: khi sử dụng dịch vụ khác nguồn gốc cho OAuth hoặc thanh toán.

    Tài liệu có chỉ thị này có thể mở tài liệu trong cùng BCG bằng {{domxref("Window.open()")}} nếu nó có giá trị COOP là `unsafe-none`.
    Trong trường hợp này, không quan trọng tài liệu được mở là khác trang web hay cùng trang web.

    Ngược lại, các tài liệu có `same-origin-allow-popups` chỉ mở và được mở trong cùng BCG nếu cả hai tài liệu đều cùng nguồn gốc và có chỉ thị `same-origin-allow-popups`.

- `noopener-allow-popups`
  - : Các tài liệu có chỉ thị này luôn được mở vào BCG mới, ngoại trừ khi được mở bằng cách điều hướng từ tài liệu cũng có `noopener-allow-popups`.
    Nó được sử dụng để hỗ trợ các trường hợp cần cách ly tiến trình các tài liệu _cùng nguồn gốc_.

    Điều này cắt đứt các kết nối giữa tài liệu mới và trình mở của nó, cách ly ngữ cảnh duyệt web cho tài liệu hiện tại bất kể nguồn gốc của tài liệu trình mở.
    Điều này đảm bảo rằng trình mở không thể chạy script trong các tài liệu được mở và ngược lại — ngay cả khi chúng cùng nguồn gốc.

    Khi điều hướng, tài liệu có chỉ thị này sẽ luôn mở các tài liệu khác trong BCG mới trừ khi chúng cùng nguồn gốc và có chỉ thị `noopener-allow-popups`.
    Khi sử dụng {{domxref("Window.open()")}}, tài liệu có chỉ thị này sẽ mở các tài liệu trong BCG mới trừ khi chúng có `unsafe-none`, và trong trường hợp này, không quan trọng chúng là cùng trang web hay khác trang web.

## Mô tả

Thông thường bạn nên đặt các chính sách sao cho chỉ các tài nguyên cùng nguồn gốc và khác nguồn gốc đáng tin cậy cần có thể script lẫn nhau mới được phép mở trong cùng nhóm ngữ cảnh trình duyệt.
Các tài nguyên khác nên được cách ly khác nguồn gốc trong nhóm của chúng.

Các phần sau đây cho thấy liệu các tài liệu sẽ được mở trong cùng BCG hay BCG mới theo điều hướng hoặc mở cửa sổ theo lập trình.

> [!NOTE]
> Đặc tả sử dụng thuật ngữ "popup" để chỉ bất kỳ tài liệu nào được mở bằng {{domxref("Window.open()")}}, dù là popup, tab, cửa sổ hay ngữ cảnh khác.

### Điều hướng

Khi điều hướng giữa các tài liệu, tài liệu mới được mở trong cùng BCG nếu hai tài liệu có "các chính sách COOP khớp nhau", và ngược lại vào BCG mới.

Các chính sách khớp nhau nếu cả hai tài liệu đều có chính sách `unsafe-none`, hoặc nếu các chính sách giống nhau và các tài liệu cùng nguồn gốc.

Bảng dưới đây hiển thị cách quy tắc này ảnh hưởng đến việc các tài liệu được mở trong cùng hay BCG mới cho các giá trị chỉ thị khác nhau.

<!-- https://html.spec.whatwg.org/multipage/browsers.html#matching-coop -->

| Trình mở (↓) / Được mở (→) | `unsafe-none` | `same-origin-allow-popups` | `same-origin`       | `noopener-allow-popups` |
| -------------------------- | ------------- | -------------------------- | ------------------- | ----------------------- |
| `unsafe-none`              | Cùng          | Mới                        | Mới                 | Mới                     |
| `same-origin-allow-popups` | Mới           | Cùng nếu cùng nguồn gốc   | Mới                 | Mới                     |
| `same-origin`              | Mới           | Mới                        | Cùng nếu cùng nguồn gốc | Mới                |
| `noopener-allow-popups`    | Mới           | Mới                        | Mới                 | Cùng nếu cùng nguồn gốc |

### Mở bằng Window.open()

Khi mở tài liệu bằng `Window.open()`, tài liệu mới được mở trong BCG mới theo các quy tắc sau, được đánh giá theo thứ tự:

1. Nếu tài liệu mới có COOP được đặt thành `noopener-allow-popups` => mở tài liệu mới trong BCG mới
2. Nếu tài liệu mới có COOP được đặt thành `unsafe-none` và tài liệu trình mở có COOP được đặt thành `same-origin-allow-popups` hoặc `noopener-allow-popups` => mở tài liệu mới trong cùng BCG
3. Nếu tài liệu mới và tài liệu mở có [các chính sách COOP khớp nhau](#navigations) => mở tài liệu mới trong cùng BCG
4. Ngược lại, mở tài liệu mới trong BCG mới

Bảng dưới đây hiển thị cách các quy tắc này ảnh hưởng đến việc các tài liệu được mở trong cùng hay BCG mới cho các giá trị chỉ thị khác nhau.

<!-- https://html.spec.whatwg.org/multipage/browsers.html#check-browsing-context-group-switch-coop-value-popup -->

| Trình mở (↓) / Được mở (→) | `unsafe-none` | `same-origin-allow-popups` | `same-origin`       | `noopener-allow-popups` |
| -------------------------- | ------------- | -------------------------- | ------------------- | ----------------------- |
| `unsafe-none`              | Cùng          | Mới                        | Mới                 | Mới                     |
| `same-origin-allow-popups` | Cùng          | Cùng nếu cùng nguồn gốc   | Mới                 | Mới                     |
| `same-origin`              | Mới           | Mới                        | Cùng nếu cùng nguồn gốc | Mới                |
| `noopener-allow-popups`    | Cùng          | Mới                        | Mới                 | Mới                     |

## Ví dụ

### Các tính năng phụ thuộc vào cách ly khác nguồn gốc

Một số tính năng nhất định, chẳng hạn như truy cập đối tượng {{jsxref("SharedArrayBuffer")}} hoặc sử dụng {{domxref("Performance.now()")}} với bộ đếm thời gian không bị giới hạn, chỉ khả dụng nếu tài liệu của bạn được {{domxref("Window.crossOriginIsolated","cách ly khác nguồn gốc","","nocode")}}.

Để sử dụng các tính năng này trong tài liệu, bạn cần đặt tiêu đề COOP thành `same-origin` và tiêu đề {{HTTPHeader("Cross-Origin-Embedder-Policy")}} thành `require-corp` (hoặc `credentialless`).
Ngoài ra, tính năng không được chặn bởi {{HTTPHeader("Permissions-Policy/cross-origin-isolated","Permissions-Policy: cross-origin-isolated")}}.

```http
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

Bạn có thể sử dụng các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để kiểm tra xem tài liệu có được cách ly khác nguồn gốc hay không, và do đó liệu các tính năng có bị hạn chế hay không:

```js
const myWorker = new Worker("worker.js");

if (crossOriginIsolated) {
  const buffer = new SharedArrayBuffer(16);
  myWorker.postMessage(buffer);
} else {
  const buffer = new ArrayBuffer(16);
  myWorker.postMessage(buffer);
}
```

### Cắt đứt mối quan hệ trình mở

Hãy xem xét một nguồn gốc giả định `example.com` có hai ứng dụng rất khác nhau trên cùng một nguồn gốc:

- Ứng dụng chat tại `/chat` cho phép bất kỳ người dùng nào liên hệ với bất kỳ người dùng nào khác và gửi tin nhắn.
- Ứng dụng quản lý mật khẩu tại `/passwords` chứa tất cả mật khẩu của người dùng, trên các dịch vụ khác nhau.

Các quản trị viên của ứng dụng "passwords" rất muốn đảm bảo rằng nó không thể được script trực tiếp bởi ứng dụng "chat", vốn có bề mặt XSS lớn hơn.
Cách "đúng" để cách ly các ứng dụng này là lưu trữ chúng trên các nguồn gốc khác nhau, nhưng trong một số trường hợp điều đó không thể thực hiện được.

Tiêu đề `Cross-Origin-Opener-Policy: noopener-allow-popups` có thể được sử dụng để đảm bảo rằng tài liệu không thể được script bởi tài liệu mở nó.

Nếu `example.com/passwords` được phục vụ với `noopener-allow-popups`, `WindowProxy` được trả về bởi {{domxref("Window.open()")}} sẽ chỉ báo rằng cửa sổ đóng ({{domxref("Window.closed")}} là `true`), vì vậy trình mở không thể script ứng dụng passwords:

```js
const handle = window.open("example.com/passwords", "passwordTab");
if (windowProxy.closed) {
  // The new window is closed so it can't be scripted.
}
```

Lưu ý rằng điều này một mình không được coi là biện pháp bảo mật đủ.
Trang web cũng cần thực hiện như sau:

- Sử dụng Fetch Metadata để chặn các yêu cầu cùng nguồn gốc đến ứng dụng nhạy cảm hơn mà không phải là yêu cầu điều hướng.
- Đảm bảo tất cả cookie xác thực của họ là `HttpOnly`.
- Đảm bảo rằng Service-Workers cấp gốc không được cài đặt bởi ứng dụng ít nhạy cảm hơn.
- Đảm bảo rằng `postMessage` hoặc `BroadcastChannel` trên ứng dụng nhạy cảm hơn không tiết lộ bất kỳ thông tin nhạy cảm nào cho bất kỳ ứng dụng cùng nguồn gốc nào khác.
- Đảm bảo trang đăng nhập của họ được phục vụ trên một nguồn gốc riêng biệt, do trình quản lý mật khẩu tự động điền dựa trên nguồn gốc.
- Hiểu rằng trình duyệt vẫn có thể cấp phát ứng dụng nhạy cảm hơn trong cùng tiến trình với ứng dụng ít nhạy cảm hơn, khiến nó dễ bị tấn công kiểu Spectre.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cross-Origin-Embedder-Policy")}}
