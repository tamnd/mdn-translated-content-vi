---
title: "WebTransport: hàm khởi tạo WebTransport()"
short-title: WebTransport()
slug: Web/API/WebTransport/WebTransport
page-type: web-api-constructor
browser-compat: api.WebTransport.WebTransport
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Hàm khởi tạo **`WebTransport()`** tạo một thể hiện đối tượng {{domxref("WebTransport")}} mới.

## Cú pháp

```js-nolint
new WebTransport(url)
new WebTransport(url, options)
```

### Tham số

- `url`
  - : Một chuỗi biểu thị URL của máy chủ HTTP/3 để kết nối tới. Scheme phải là HTTPS và số cổng phải được chỉ định rõ ràng.
- `options` {{optional_inline}}
  - : Một object có thể có các thuộc tính sau:
    - `allowPooling` {{optional_inline}}
      - : Một giá trị boolean.
        Nếu `true`, kết nối mạng cho thể hiện {{domxref("WebTransport")}} này có thể được chia sẻ với một pool các phiên HTTP/3 khác.
        Mặc định là `false`, và kết nối không thể được chia sẻ.
    - `congestionControl` {{optional_inline}}
      - : Một chuỗi cho biết ưu tiên của ứng dụng đối với việc thuật toán kiểm soát tắc nghẽn dùng khi gửi dữ liệu qua kết nối này được tinh chỉnh cho thông lượng hoặc độ trễ thấp.
        Đây là một gợi ý cho user agent.
        Các giá trị cho phép là: `default` (mặc định), `throughput`, và `low-latency`.
    - `requireUnreliable` {{optional_inline}}
      - : Một giá trị boolean.
        Nếu `true`, kết nối không thể được thiết lập qua HTTP/2 nếu không thể có kết nối HTTP/3.
        Mặc định là `false`.
    - `serverCertificateHashes` {{optional_inline}}
      - : Một mảng các object, mỗi object xác định giá trị hash của một chứng chỉ máy chủ cùng với tên của thuật toán đã dùng để tạo hash đó.
        Tùy chọn này chỉ được hỗ trợ cho các transport dùng kết nối riêng (`allowPooling` là `false`).

        Nếu được chỉ định, trình duyệt sẽ cố xác thực chứng chỉ do máy chủ cung cấp bằng hash chứng chỉ đã cung cấp thay vì dùng Web public key infrastructure (PKI).
        Nếu có bất kỳ hash nào khớp, trình duyệt biết rằng máy chủ đang giữ một chứng chỉ đáng tin cậy và sẽ kết nối như bình thường.
        Nếu mảng rỗng, user agent sẽ dùng cùng quy trình xác minh chứng chỉ PKI như với một thao tác fetch bình thường.

        Tính năng này cho phép nhà phát triển kết nối tới các máy chủ WebTransport mà bình thường sẽ khó có được chứng chỉ công khai đáng tin cậy, chẳng hạn các host không thể truy cập công khai hoặc các host tạm thời như máy ảo.

        > [!NOTE]
        > Ứng dụng web thường sẽ lấy các hash từ một bên trung gian đáng tin cậy.
        > Ví dụ, bạn có thể dùng một nhà cung cấp đám mây để cung cấp các VM chạy máy chủ WebTransport của bạn.
        > Nhà cung cấp đó có quyền truy cập đáng tin cậy vào máy chủ, có thể yêu cầu chứng chỉ, tạo hash và cung cấp chúng cho ứng dụng thông qua một API (được trung gian qua PKI) hoặc qua bảng điều khiển đám mây.
        > Lúc này ứng dụng web có thể kết nối trực tiếp tới máy chủ chạy trên VM bằng các hash đã cung cấp, ngay cả khi bản thân VM không có chứng chỉ TLS dài hạn.

        Chứng chỉ phải là chứng chỉ X.509v3 có thời hạn hiệu lực dưới 2 tuần, và thời điểm hiện tại phải nằm trong khoảng hiệu lực đó.
        Định dạng của public key trong chứng chỉ phụ thuộc vào triển khai, nhưng tối thiểu phải bao gồm ECDSA với nhóm tên secp256r1 (NIST P-256), và không được bao gồm khóa RSA.
        Vì vậy, một khóa ECSDA là định dạng public key mặc định có khả năng tương thích.
        User agent có thể đặt thêm yêu cầu; các yêu cầu này sẽ được liệt kê trong phần [tương thích trình duyệt](#browser_compatibility) nếu biết.

        Mỗi object trong mảng có các thuộc tính sau:
        - `algorithm`
          - : Một chuỗi có giá trị: `sha-256` (không phân biệt hoa thường).
            Lưu ý rằng chuỗi này biểu thị thuật toán dùng để xác minh hash, và bất kỳ hash nào dùng một thuật toán không xác định sẽ bị bỏ qua.
            Tại thời điểm viết tài liệu, `SHA-256` là thuật toán hash duy nhất được liệt kê trong đặc tả.

        - `value`
          - : Một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) hoặc {{jsxref("TypedArray")}} chứa giá trị hash.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `serverCertificateHashes` được chỉ định nhưng giao thức transport không hỗ trợ tính năng này.
- `SyntaxError`
  - : Được ném ra nếu `url` đã chỉ định không hợp lệ, nếu scheme không phải HTTPS, hoặc nếu URL chứa fragment.
- `TypeError`
  - : Được ném ra nếu `serverCertificateHashes` được đặt cho một kết nối không dùng dedicated connection (nói cách khác, nếu `allowPooling` là `true`).

## Ví dụ

### Kết nối với tùy chọn mặc định

Ví dụ này cho thấy cách bạn có thể tạo một `WebTransport` chỉ với một URL, chờ nó kết nối, rồi theo dõi transport và báo khi nó đóng.

Đầu tiên chúng ta định nghĩa một phương thức `async` nhận một URL và dùng nó để tạo đối tượng `WebTransport`.
Không có tùy chọn constructor nào được chỉ định, nên kết nối dùng tùy chọn mặc định: kết nối riêng, không bắt buộc hỗ trợ transport không đáng tin cậy, kiểm soát tắc nghẽn mặc định, và xác thực Web PKI thông thường với máy chủ.
Lưu ý rằng scheme phải là HTTPS và số cổng phải được chỉ định rõ ràng.

Khi promise {{domxref("WebTransport.ready")}} được giải quyết, bạn có thể bắt đầu dùng kết nối.

```js
async function initTransport(url) {
  // Khởi tạo kết nối transport
  const transport = new WebTransport(url);

  // Kết nối có thể dùng được khi ready được giải quyết
  await transport.ready;
  return transport;
}
```

Bạn có thể phản ứng khi kết nối đóng bằng cách chờ promise {{domxref("WebTransport.closed")}} được giải quyết.
Các lỗi do thao tác `WebTransport` trả về có kiểu {{domxref("WebTransportError")}}, và chứa thêm dữ liệu ngoài tập {{domxref("DOMException")}} tiêu chuẩn.

Phương thức `closeTransport()` bên dưới cho thấy cách làm đó.
Trong một khối `try...catch`, nó dùng `await` để chờ promise `closed` được giải quyết hoặc bị từ chối, rồi báo cáo xem kết nối đã đóng một cách chủ ý hay do lỗi.

```js
async function closeTransport(transport) {
  // Phản hồi khi kết nối đóng
  try {
    await transport.closed;
    console.log(`Kết nối HTTP/3 tới ${url} đã đóng êm thấm.`);
  } catch (error) {
    console.error(`Kết nối HTTP/3 tới ${url} đã đóng do ${error}.`);
  }
}
```

Ta có thể gọi các hàm bất đồng bộ ở trên trong chính một hàm bất đồng bộ khác, như minh họa dưới đây.

```js
// Dùng transport
async function useTransport(url) {
  const transport = await initTransport(url);

  // Dùng đối tượng transport để gửi và nhận dữ liệu
  // …

  // Khi xong, đóng transport
  await closeTransport(transport);
}

const url = "https://example.com:4999/wt";
useTransport(url);
```

### Kết nối với hash chứng chỉ máy chủ

Ví dụ dưới đây cho thấy mã để tạo một `WebTransport` chỉ định tùy chọn `serverCertificateHashes`.
Trong trường hợp này mảng chứa hai hash, cả hai đều được mã hóa bằng thuật toán SHA-256.
Lưu ý rằng tùy chọn `allowPooling` phải là `false` (mặc định).

```js
const transport = new WebTransport(url, {
  serverCertificateHashes: [
    {
      algorithm: "sha-256",
      value: "5a155927eba7996228455e4721e6fe5f739ae15db6915d765e5db302b4f8a274",
    },
    {
      algorithm: "sha-256",
      value: "7d7094e7a8d3097feff3b5ee84fa5cab58e4de78f38bcfdee5ea8b51f4bfa8fd",
    },
  ],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
