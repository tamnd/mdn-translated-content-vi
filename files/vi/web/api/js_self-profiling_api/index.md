---
title: JS Self-Profiling API
slug: Web/API/JS_Self-Profiling_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Profiler
spec-urls: https://wicg.github.io/js-self-profiling/
---

{{DefaultAPISidebar("JS Self-Profiling API")}}{{SeeCompatTable}}

JS Self-Profiling API cho phép một trang web chạy một trình lấy mẫu profiler, để hiểu nơi nó đang dành thời gian thực thi JavaScript.

## Khái niệm và cách sử dụng

Để bắt đầu một profile, một trang web tạo một phiên bản {{domxref("Profiler")}}. Ngay khi phiên bản được tạo, nó bắt đầu lấy mẫu ngữ cảnh thực thi JavaScript.

Để dừng thu thập mẫu và truy xuất profile, trang web gọi {{domxref("Profiler.stop()")}}. Điều này trả về một {{jsxref("Promise")}} phân giải thành một đối tượng chứa dữ liệu profile.

Ví dụ, hàm sau tạo một profiler, sau đó gọi một hàm `genPrimes()`, sau đó dừng profiler và truy xuất dữ liệu profile:

```js
async function profileGeneratePrimes() {
  const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 10000 });

  genPrimes();

  const trace = await profiler.stop();
  console.log(trace);
}
```

Profiler là một _trình lấy mẫu profiler_: có nghĩa là nó định kỳ ghi lại (hoặc _lấy mẫu_) trạng thái hiện tại của {{glossary("call stack")}} JavaScript. Profile bao gồm tập hợp các mẫu này. Điều này cho phép bạn hiểu, về mặt thống kê, nơi chương trình đang dành hầu hết thời gian của mình.

Để hiểu chính xác một profile chứa gì và cách nó được định dạng, xem [Cấu trúc và định dạng profile](/en-US/docs/Web/API/JS_Self-Profiling_API/Profile_content_and_format).

### Thực tiễn tốt nhất khi profiling

Việc thu thập và xử lý dữ liệu profile tự nó gây ra chi phí hiệu suất, và các nhà phát triển nên cẩn thận để quản lý điều này. Các thực hành để giảm thiểu chi phí hiệu suất bao gồm:

- Sử dụng các tùy chọn [`maxBufferSize`](/en-US/docs/Web/API/Profiler/Profiler#maxbuffersize) và [`sampleInterval`](/en-US/docs/Web/API/Profiler/Profiler#sampleinterval) để kiểm soát bao nhiêu mẫu cần lấy và tần suất lấy mẫu.
- Lấy mẫu trong các khoảng thời gian ngắn theo kiểu lấy mẫu: ví dụ, theo dõi trong 5 giây trong mỗi 60 giây.
- Xử lý các mẫu trong một web worker để tránh ảnh hưởng đến hiệu suất trên luồng chính.
- Tổng hợp các mẫu trên client trước khi gửi chúng đến endpoint telemetry.

Nếu JavaScript trong trang web của bạn bị {{glossary("Minification", "rút gọn")}}, bạn sẽ cần chuyển đổi dữ liệu profile dựa trên {{glossary("Source map", "source map")}}, trên client hoặc trên server, trước khi dữ liệu có thể sử dụng được.

## Giao diện

- {{domxref("Profiler")}} {{Experimental_Inline}}
  - : Giao diện `Profiler` được sử dụng để tạo các profile.

## Yêu cầu bảo mật

Để sử dụng API này, tài liệu phải được phục vụ với [document policy](https://wicg.github.io/document-policy/) bao gồm điểm cấu hình `"js-profiling"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
