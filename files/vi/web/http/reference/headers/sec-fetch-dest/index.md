---
title: Sec-Fetch-Dest header
short-title: Sec-Fetch-Dest
slug: Web/HTTP/Reference/Headers/Sec-Fetch-Dest
page-type: http-header
browser-compat: http.headers.Sec-Fetch-Dest
sidebar: http
---

Tiêu đề HTTP **`Sec-Fetch-Dest`** {{Glossary("fetch metadata request header")}} cho biết _đích_ của yêu cầu.
Đó là bộ khởi tạo của yêu cầu fetch ban đầu, tức là nơi (và cách) dữ liệu được fetch sẽ được sử dụng.

Điều này cho phép máy chủ xác định liệu có nên phục vụ yêu cầu hay không dựa trên việc nó có phù hợp với cách được _kỳ vọng_ sử dụng hay không. Ví dụ: yêu cầu với đích `audio` nên yêu cầu dữ liệu âm thanh, không phải một số loại tài nguyên khác (ví dụ: tài liệu chứa thông tin nhạy cảm của người dùng).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Fetch-Dest: audio
Sec-Fetch-Dest: audioworklet
Sec-Fetch-Dest: document
Sec-Fetch-Dest: embed
Sec-Fetch-Dest: empty
Sec-Fetch-Dest: fencedframe
Sec-Fetch-Dest: font
Sec-Fetch-Dest: frame
Sec-Fetch-Dest: iframe
Sec-Fetch-Dest: image
Sec-Fetch-Dest: json
Sec-Fetch-Dest: manifest
Sec-Fetch-Dest: object
Sec-Fetch-Dest: paintworklet
Sec-Fetch-Dest: report
Sec-Fetch-Dest: script
Sec-Fetch-Dest: serviceworker
Sec-Fetch-Dest: sharedworker
Sec-Fetch-Dest: style
Sec-Fetch-Dest: track
Sec-Fetch-Dest: video
Sec-Fetch-Dest: webidentity
Sec-Fetch-Dest: worker
Sec-Fetch-Dest: xslt
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

> [!NOTE]
> Các chỉ thị này tương ứng với các giá trị được trả về bởi {{domxref("Request.destination")}}.

- `audio`
  - : Đích là dữ liệu âm thanh. Có thể xuất phát từ thẻ HTML {{HTMLElement("audio")}}.
- `audioworklet`
  - : Đích là dữ liệu được fetch để sử dụng bởi một audio worklet. Có thể xuất phát từ lời gọi {{domxref("Worklet.addModule()", "audioWorklet.addModule()")}}.
- `document`
  - : Đích là tài liệu (HTML hoặc XML), và yêu cầu là kết quả của điều hướng cấp cao do người dùng khởi tạo (ví dụ: kết quả từ việc người dùng nhấp vào liên kết).
- `embed`
  - : Đích là nội dung được nhúng. Có thể xuất phát từ thẻ HTML {{HTMLElement("embed")}}.
- `empty`
  - : Đích là chuỗi rỗng. Được sử dụng cho các đích không có giá trị riêng. Ví dụ: {{domxref("Window/fetch", "fetch()")}}, {{domxref("navigator.sendBeacon()")}}, {{domxref("EventSource")}}, {{domxref("XMLHttpRequest")}}, {{domxref("WebSocket")}}, v.v.
- `fencedframe` {{experimental_inline}}
  - : Đích là một [fenced frame](/en-US/docs/Web/API/Fenced_frame_API).
- `font`
  - : Đích là một font. Có thể xuất phát từ CSS {{cssxref("@font-face")}}.
- `frame`
  - : Đích là một frame. Có thể xuất phát từ thẻ HTML {{HTMLElement("frame")}}.
- `iframe`
  - : Đích là một iframe. Có thể xuất phát từ thẻ HTML {{HTMLElement("iframe")}}.
- `image`
  - : Đích là một hình ảnh. Có thể xuất phát từ HTML {{HTMLElement("img")}}, SVG {{SVGElement("image")}}, CSS {{cssxref("background-image")}}, CSS {{cssxref("cursor")}}, CSS {{cssxref("list-style-image")}}, v.v.
- `json`
  - : Đích là JSON. Có thể xuất phát từ [importing a module from JavaScript with the `type: "json"` attribute](/en-US/docs/Web/JavaScript/Reference/Statements/import/with#importing_json_modules_with_the_type_attribute).
- `manifest`
  - : Đích là manifest. Có thể xuất phát từ HTML [\<link rel=manifest>](/en-US/docs/Web/HTML/Reference/Attributes/rel/manifest).
- `object`
  - : Đích là một đối tượng. Có thể xuất phát từ thẻ HTML {{HTMLElement("object")}}.
- `paintworklet`
  - : Đích là một paint worklet. Có thể xuất phát từ lời gọi {{domxref('Worklet.addModule', 'CSS.PaintWorklet.addModule()')}}.
- `report`
  - : Đích là một báo cáo (ví dụ: báo cáo chính sách bảo mật nội dung).
- `script`
  - : Đích là một script. Có thể xuất phát từ thẻ HTML {{HTMLElement("script")}} hoặc lời gọi {{domxref("WorkerGlobalScope.importScripts()")}}.
- `serviceworker`
  - : Đích là một service worker. Có thể xuất phát từ lời gọi {{domxref("ServiceWorkerContainer.register","navigator.serviceWorker.register()")}}.
- `sharedworker`
  - : Đích là một shared worker. Có thể xuất phát từ {{domxref("SharedWorker")}}.
- `style`
  - : Đích là một style. Có thể xuất phát từ HTML {{HTMLElement("link","&lt;link rel=stylesheet&gt;")}} hoặc CSS {{cssxref("@import")}}.
- `track`
  - : Đích là một text track HTML. Có thể xuất phát từ thẻ HTML {{HTMLElement("track")}}.
- `video`
  - : Đích là dữ liệu video. Có thể xuất phát từ thẻ HTML {{HTMLElement("video")}}.
- `webidentity`
  - : Đích là endpoint liên quan đến việc xác minh danh tính người dùng. Ví dụ: nó được sử dụng trong [FedCM API](/en-US/docs/Web/API/FedCM_API) để xác minh tính xác thực của các endpoint nhà cung cấp danh tính (IdP), bảo vệ chống lại các cuộc tấn công {{glossary("CSRF")}}.
- `worker`
  - : Đích là một {{domxref("Worker")}}.
- `xslt`
  - : Đích là một XSLT transform.

## Ví dụ

### Sử dụng Sec-Fetch-Dest

Yêu cầu cross-site được tạo bởi phần tử {{HTMLElement("img")}} sẽ dẫn đến yêu cầu với các tiêu đề HTTP sau (lưu ý rằng đích là `image`):

```http
Sec-Fetch-Dest: image
Sec-Fetch-Mode: no-cors
Sec-Fetch-Site: cross-site
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-Fetch-Mode")}}, {{HTTPHeader("Sec-Fetch-Site")}}, {{HTTPHeader("Sec-Fetch-User")}} fetch metadata request headers
- [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) (web.dev)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
