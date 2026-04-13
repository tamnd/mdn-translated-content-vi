---
title: "GPU: phương thức requestAdapter()"
short-title: requestAdapter()
slug: Web/API/GPU/requestAdapter
page-type: web-api-instance-method
browser-compat: api.GPU.requestAdapter
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`requestAdapter()`** của giao diện {{domxref("GPU")}} trả về một {{jsxref("Promise")}} sẽ được hoàn tất với một thể hiện đối tượng {{domxref("GPUAdapter")}}. Từ đó bạn có thể yêu cầu một {{domxref("GPUDevice")}}, thông tin adapter, các tính năng, và các giới hạn.

Lưu ý rằng user agent sẽ quyết định có trả về một adapter hay không. Nếu có, nó sẽ chọn theo các tùy chọn được cung cấp. Nếu không có tùy chọn nào được cung cấp, device sẽ cấp quyền truy cập vào adapter mặc định, thường đã đủ tốt cho hầu hết mục đích.

## Cú pháp

```js-nolint
requestAdapter()
requestAdapter(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `powerPreference` {{optional_inline}}
      - : Một giá trị liệt kê có thể dùng để cung cấp gợi ý cho user agent về kiểu adapter nào nên được chọn từ các adapter sẵn có của hệ thống. Các giá trị khả dụng gồm:
        - `undefined` (hoặc không chỉ định), không cung cấp gợi ý nào.
        - `"low-power"`, cung cấp gợi ý ưu tiên tiết kiệm điện thay vì hiệu năng. Nếu ứng dụng của bạn hoạt động tốt với thiết lập này, nên dùng nó vì nó có thể cải thiện đáng kể thời lượng pin trên thiết bị di động. Đây thường là giá trị mặc định nếu không cung cấp tùy chọn.
        - `"high-performance"`, cung cấp gợi ý ưu tiên hiệu năng hơn mức tiêu thụ điện. Bạn chỉ nên chỉ định giá trị này khi thật sự cần thiết, vì nó có thể làm giảm đáng kể thời lượng pin trên thiết bị di động. Nó cũng có thể dẫn đến việc {{domxref("GPUDevice")}} bị mất nhiều hơn - hệ thống đôi khi sẽ chọn chuyển sang một adapter tiết kiệm điện hơn để tiết kiệm pin.

        Mục đích chính của gợi ý này là tác động đến GPU nào được dùng trong hệ thống nhiều GPU. Ví dụ, một số máy tính xách tay có GPU tích hợp tiết kiệm điện và GPU rời hiệu năng cao. Nhiều yếu tố khác nhau có thể ảnh hưởng đến adapter nào được trả về, bao gồm trạng thái pin, màn hình được gắn, hoặc GPU có thể tháo rời.

        > [!NOTE]
        > Trên Chrome chạy trên các thiết bị macOS có hai GPU, nếu gọi `requestAdapter()` mà không có tùy chọn `powerPreference`, GPU rời hiệu năng cao sẽ được trả về khi thiết bị của người dùng đang dùng nguồn AC. Nếu không, GPU tích hợp tiết kiệm điện sẽ được trả về.

### Adapter dự phòng

Adapter do user agent cung cấp có thể là một **fallback adapter** nếu nó xác định đây là lựa chọn phù hợp nhất hiện có. Một fallback adapter thường có các đánh đổi hiệu năng đáng kể để đổi lấy một hoặc nhiều yếu tố như khả năng tương thích rộng hơn, hành vi dễ đoán hơn, hoặc cải thiện quyền riêng tư. Ví dụ, một số trình duyệt có thể cung cấp một triển khai dựa trên phần mềm của API thông qua một fallback adapter. Fallback adapter sẽ không có trên mọi hệ thống.

Nếu bạn muốn ngăn ứng dụng của mình chạy trên các fallback adapter, bạn nên kiểm tra thuộc tính {{domxref("GPUAdapter.isFallbackAdapter")}} trước khi yêu cầu một {{domxref("GPUDevice")}}.

> [!NOTE]
> Đặc tả có một tùy chọn `forceFallbackAdapter` cho `requestAdapter()`. Đây là một giá trị boolean; nếu đặt thành `true`, nó buộc user agent trả về fallback adapter nếu có. Hiện chưa có trình duyệt nào hỗ trợ.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ được hoàn tất với một thể hiện đối tượng {{domxref("GPUAdapter")}} nếu yêu cầu thành công.

`requestAdapter()` sẽ giải quyết thành `null` nếu không có adapter phù hợp.

### Ngoại lệ

Không có.

## Ví dụ

```js
async function init() {
  if (!navigator.gpu) {
    throw Error("WebGPU not supported.");
  }

  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw Error("Couldn't request WebGPU adapter.");
  }

  const device = await adapter.requestDevice();

  // …
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
