---
title: "Performance: measureUserAgentSpecificMemory() method"
short-title: measureUserAgentSpecificMemory()
slug: Web/API/Performance/measureUserAgentSpecificMemory
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Performance.measureUserAgentSpecificMemory
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức **`measureUserAgentSpecificMemory()`** được dùng để ước tính mức sử dụng bộ nhớ của một ứng dụng web, bao gồm tất cả iframe và worker của nó.

## Cú pháp

```js-nolint
measureUserAgentSpecificMemory()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ resolve thành một đối tượng chứa các thuộc tính sau:

- `bytes`
  - : Một số biểu thị tổng mức sử dụng bộ nhớ.
- `breakdown`
  - : Một {{jsxref("Array")}} các đối tượng phân chia tổng `bytes` và cung cấp thông tin phân loại cùng thuộc tính. Đối tượng chứa các thuộc tính sau:
    - `bytes`
      - : Kích thước bộ nhớ mà entry này mô tả.
    - `attribution`
      - : Một {{jsxref("Array")}} các phần tử container của các JavaScript realm đang dùng bộ nhớ. Đối tượng này có các thuộc tính sau:
        - `url`
          - : Nếu attribution này tương ứng với một JavaScript realm cùng origin, thuộc tính này chứa URL của realm. Nếu không, nó là chuỗi `"cross-origin-url"`.
        - `container`
          - : Một đối tượng mô tả phần tử DOM chứa JavaScript realm này. Đối tượng này có các thuộc tính sau:
            - `id`
              - : Thuộc tính `id` của phần tử container.
            - `src`
              - : Thuộc tính `src` của phần tử container. Nếu phần tử container là phần tử {{HTMLElement("object")}}, trường này chứa giá trị của thuộc tính `data`.
        - `scope`
          - : Một chuỗi mô tả loại JavaScript realm cùng origin. Có thể là `"Window"`, `"DedicatedWorkerGlobalScope"`, `"SharedWorkerGlobalScope"`, `"ServiceWorkerGlobalScope"` hoặc `"cross-origin-aggregated"` cho trường hợp cross-origin.
    - `types`
      - : Một mảng các kiểu bộ nhớ do triển khai định nghĩa, liên kết với bộ nhớ.

Ví dụ về giá trị trả về:

```json
{
  "bytes": 1500000,
  "breakdown": [
    {
      "bytes": 1000000,
      "attribution": [
        {
          "url": "https://example.com",
          "scope": "Window"
        }
      ],
      "types": ["DOM", "JS"]
    },
    {
      "bytes": 0,
      "attribution": [],
      "types": []
    },
    {
      "bytes": 500000,
      "attribution": [
        {
          "url": "https://example.com/iframe.html",
          "container": {
            "id": "example-id",
            "src": "redirect.html?target=iframe.html"
          },
          "scope": "Window"
        }
      ],
      "types": ["JS", "DOM"]
    }
  ]
}
```

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu các [yêu cầu bảo mật](#security_requirements) để ngăn rò rỉ thông tin cross-origin không được đáp ứng.

## Mô tả

Trình duyệt tự động cấp phát bộ nhớ khi các đối tượng được tạo và giải phóng nó khi các đối tượng đó không còn được tham chiếu nữa (garbage collection). Cơ chế GC này chỉ là một phép xấp xỉ, vì bài toán tổng quát là xác định liệu một phần bộ nhớ cụ thể có còn cần thiết hay không là không thể giải được (xem thêm [JavaScript Memory Management](/en-US/docs/Web/JavaScript/Guide/Memory_management)). Nhà phát triển cần bảo đảm rằng các đối tượng được thu gom rác, không rò rỉ bộ nhớ, và mức sử dụng bộ nhớ không tăng không cần thiết theo thời gian dẫn đến ứng dụng web chậm và không phản hồi. Rò rỉ bộ nhớ thường do quên hủy đăng ký event listener, không đóng worker, tích lũy đối tượng trong mảng, v.v.

API `measureUserAgentSpecificMemory()` tổng hợp dữ liệu sử dụng bộ nhớ để giúp bạn tìm rò rỉ bộ nhớ. Nó có thể dùng để phát hiện hồi quy bộ nhớ hoặc để A/B test tính năng nhằm đánh giá tác động bộ nhớ của chúng. Thay vì gọi phương thức này một lần, tốt hơn là gọi định kỳ để theo dõi cách mức sử dụng bộ nhớ thay đổi trong suốt phiên làm việc.

Các giá trị `byte` mà API này trả về không thể so sánh giữa các trình duyệt hoặc giữa các phiên bản khác nhau của cùng một trình duyệt, vì chúng phụ thuộc rất nhiều vào triển khai. Ngoài ra, cách cung cấp các mảng `breakdown` và `attribution` cũng do trình duyệt quyết định. Tốt nhất là không mã hóa cứng bất kỳ giả định nào về dữ liệu này. API này thực sự nhằm được gọi định kỳ (với khoảng thời gian ngẫu nhiên) để tổng hợp dữ liệu và phân tích chênh lệch giữa các mẫu.

## Yêu cầu bảo mật

Để dùng phương thức này, tài liệu của bạn phải ở trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts) và {{domxref("Window.crossOriginIsolated","cross-origin isolated","","nocode")}}.

Bạn có thể dùng các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để kiểm tra liệu tài liệu có được cô lập cross-origin hay không:

```js
if (crossOriginIsolated) {
  // Use measureUserAgentSpecificMemory
}
```

## Ví dụ

### Theo dõi mức sử dụng bộ nhớ

Đoạn mã sau cho thấy cách gọi phương thức `measureUserAgentSpecificMemory()` cứ mỗi năm phút một lần tại một khoảng ngẫu nhiên bằng cách dùng [phân phối mũ](https://en.wikipedia.org/wiki/Exponential_distribution#Random_variate_generation).

```js
function runMemoryMeasurements() {
  const interval = -Math.log(Math.random()) * 5 * 60 * 1000;
  console.log(`Next measurement in ${Math.round(interval / 1000)} seconds.`);
  setTimeout(measureMemory, interval);
}

async function measureMemory() {
  const memorySample = await performance.measureUserAgentSpecificMemory();
  console.log(memorySample);
  runMemoryMeasurements();
}

if (crossOriginIsolated) {
  runMemoryMeasurements();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window.setTimeout", "setTimeout()")}}
- [Monitor your web page's total memory usage with measureUserAgentSpecificMemory() - web.dev](https://web.dev/articles/monitor-total-page-memory-usage)
