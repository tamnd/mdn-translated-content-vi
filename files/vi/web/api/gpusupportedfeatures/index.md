---
title: GPUSupportedFeatures
slug: Web/API/GPUSupportedFeatures
page-type: web-api-interface
browser-compat: api.GPUSupportedFeatures
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUSupportedFeatures`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} là [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) mô tả các chức năng bổ sung được hỗ trợ bởi {{domxref("GPUAdapter")}}.

Đối tượng `GPUSupportedFeatures` cho bộ điều hợp hiện tại được truy cập thông qua thuộc tính {{domxref("GPUAdapter.features")}} — dùng thuộc tính này để kiểm tra những tính năng nào mà thiết lập hiện tại của bạn hỗ trợ. Để tạo {{domxref("GPUDevice")}} với một tính năng cụ thể được bật, bạn cần chỉ định nó trong mảng [`requiredFeatures`](/en-US/docs/Web/API/GPUAdapter/requestDevice#requiredfeatures) của bộ mô tả {{domxref("GPUAdapter.requestDevice()")}}.

Cần lưu ý rằng không phải tất cả các tính năng đều có sẵn cho WebGPU trong tất cả các trình duyệt hỗ trợ nó, ngay cả khi các tính năng được hỗ trợ bởi phần cứng bên dưới. Điều này có thể do ràng buộc trong hệ thống bên dưới, trình duyệt hoặc bộ điều hợp. Ví dụ:

- Hệ thống bên dưới có thể không đảm bảo được việc cung cấp một tính năng theo cách tương thích với một trình duyệt nhất định.
- Nhà cung cấp trình duyệt có thể chưa tìm được cách triển khai hỗ trợ cho tính năng đó một cách an toàn, hoặc đơn giản là chưa làm điều đó.

Nếu bạn muốn tận dụng một tính năng bổ sung cụ thể trong ứng dụng WebGPU, nên kiểm tra kỹ lưỡng.

{{InheritanceDiagram}}

## Các tính năng có sẵn

Các tính năng bổ sung sau được xác định trong WebGPU. Lưu ý rằng tập hợp chính xác các tính năng có sẵn sẽ thay đổi theo các triển khai và thiết bị vật lý khác nhau và sẽ thay đổi theo thời gian.

| Tên tính năng                        | Mô tả                                                                                                                                                                                                                                           |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bgra8unorm-storage`                 | Khi được bật, cho phép `STORAGE_BINDING` [`usage`](/en-US/docs/Web/API/GPUDevice/createTexture#usage) của {{domxref("GPUTexture")}} với định dạng `bgra8unorm`.                                                                                 |
| `clip-distances`                     | Khi được bật, cho phép sử dụng [`clip_distances`](https://gpuweb.github.io/gpuweb/wgsl/#built-in-values-clip_distances) trong WGSL.                                                                                                             |
| `core-features-and-limits`           | Khi được bật, biểu thị rằng {{domxref("GPUAdapter")}} / {{domxref("GPUDevice")}} có thể sử dụng tất cả các tính năng và giới hạn WebGPU cốt lõi.                                                                                                |
| `depth-clip-control`                 | Khi được bật, cho phép vô hiệu hóa [depth-clipping](https://gpuweb.github.io/gpuweb/#depth-clipping).                                                                                                                                           |
| `depth32float-stencil8`              | Khi được bật, cho phép tạo texture với định dạng `depth32float-stencil8`.                                                                                                                                                                       |
| `dual-source-blending`               | Khi được bật, cho phép sử dụng [`dual_source_blending`](https://gpuweb.github.io/gpuweb/wgsl/#extension-dual_source_blending) trong WGSL.                                                                                                       |
| `float32-blendable`                  | Khi được bật, cho phép [blending](/en-US/docs/Web/API/GPUDevice/createRenderPipeline#blend) của các {{domxref("GPUTexture")}} với định dạng `r32float`, `rg32float` và `rgba32float`.                                                           |
| `float32-filterable`                 | Khi được bật, cho phép [lọc](/en-US/docs/Web/API/GPUDevice/createSampler#magfilter) các {{domxref("GPUTexture")}} với định dạng `r32float`, `rg32float` và `rgba32float`.                                                                       |
| `indirect-first-instance`            | Khi được bật, cho phép sử dụng các giá trị `firstInstance` khác không trong thuộc tính `indirectBuffer` của các phương thức `drawIndirect()` và `drawIndexedIndirect()`.                                                                        |
| `primitive-index`                    | Khi được bật, cho phép sử dụng biến dựng sẵn [`primitive_index`](https://gpuweb.github.io/gpuweb/wgsl/#built-in-values-primitive_index) trong WGSL.                                                                                             |
| `rg11b10ufloat-renderable`           | Khi được bật, cho phép `RENDER_ATTACHMENT` [`usage`](/en-US/docs/Web/API/GPUDevice/createTexture#usage) của các {{domxref("GPUTexture")}} với định dạng `rg11b10ufloat`, cũng như blending và multisampling của chúng.                          |
| `shader-f16`                         | Khi được bật, cho phép sử dụng kiểu dấu phẩy động nửa độ chính xác [`f16`](https://gpuweb.github.io/gpuweb/wgsl/#extension-f16) trong WGSL.                                                                                                     |
| `subgroups`                          | Khi được bật, cho phép sử dụng [subgroups](https://gpuweb.github.io/gpuweb/wgsl/#extension-subgroups) trong WGSL.                                                                                                                               |
| `texture-component-swizzle`          | Khi được bật, cho phép đặt thuộc tính [`swizzle`](/en-US/docs/Web/API/GPUTexture/createView#swizzle) khi gọi `GPUTexture.createView()`.                                                                                                         |
| `texture-compression-bc`             | Khi được bật, cho phép tạo các texture nén BC hai chiều.                                                                                                                                                                                        |
| `texture-compression-bc-sliced-3d`   | Khi được bật, cho phép tạo các texture nén BC ba chiều.                                                                                                                                                                                         |
| `texture-compression-astc`           | Khi được bật, cho phép tạo các texture nén ASTC hai chiều.                                                                                                                                                                                      |
| `texture-compression-astc-sliced-3d` | Khi được bật, cho phép tạo các texture nén ASTC ba chiều.                                                                                                                                                                                       |
| `texture-compression-etc2`           | Khi được bật, cho phép tạo các texture nén ETC2 hai chiều.                                                                                                                                                                                      |
| `texture-formats-tier1`              | Khi được bật, tự động bật tính năng `rg11b10ufloat-renderable` và cho phép tạo các {{domxref("GPUTexture")}} với các định dạng được chỉ định trong [Tier 1](/en-US/docs/Web/API/GPUDevice/createTexture#tier_1).                                |
| `texture-formats-tier2`              | Khi được bật, tự động bật các tính năng `rg11b10ufloat-renderable` và `texture-formats-tier1`, và cho phép tạo các {{domxref("GPUTexture")}} với các định dạng được chỉ định trong [Tier 2](/en-US/docs/Web/API/GPUDevice/createTexture#tier2). |
| `timestamp-query`                    | Khi được bật, cho phép chạy các truy vấn timestamp để đo thời gian thực thi các compute và render pass.                                                                                                                                         |

## Thuộc tính phiên bản

Các thuộc tính sau có sẵn cho tất cả [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) chỉ đọc.

- {{jsxref("Set.prototype.size", "size")}}
  - : Trả về số lượng giá trị trong tập hợp.

## Phương thức phiên bản

Các phương thức sau có sẵn cho tất cả [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) chỉ đọc.

- {{jsxref("Set.prototype.has()", "has()")}}
  - : Trả về boolean cho biết một phần tử có mặt với giá trị đã cho trong tập hợp hay không.
- {{jsxref("Set.prototype.values()", "values()")}}
  - : Trả về đối tượng iterator mới tạo ra **các giá trị** của mỗi phần tử trong tập hợp theo thứ tự chèn.
- {{jsxref("Set.prototype.keys()", "keys()")}}
  - : Bí danh cho {{jsxref("Set.prototype.values()", "values()")}}.
- {{jsxref("Set.prototype.entries()", "entries()")}}
  - : Trả về đối tượng iterator mới chứa **mảng `[value, value]`** cho mỗi phần tử trong tập hợp, theo thứ tự chèn.
- {{jsxref("Set.prototype.forEach()", "forEach()")}}
  - : Gọi hàm callback được cung cấp một lần cho mỗi giá trị có trong tập hợp, theo thứ tự chèn.

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

  const adapterFeatures = adapter.features;

  // Return the size of the set
  console.log(adapterFeatures.size);

  // Check whether a feature is supported by the adapter
  console.log(adapterFeatures.has("texture-compression-astc"));

  // Iterate through all the set values using values()
  const valueIterator = adapterFeatures.values();
  for (const value of valueIterator) {
    console.log(value);
  }

  // Iterate through all the set values using keys()
  const keyIterator = adapterFeatures.keys();
  for (const value of keyIterator) {
    console.log(value);
  }

  // Iterate through all the set values using entries()
  const entryIterator = adapterFeatures.entries();
  for (const entry of entryIterator) {
    console.log(entry[0]);
  }

  // Iterate through all the set values using forEach()
  adapterFeatures.forEach((value) => {
    console.log(value);
  });

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Feature Index](https://gpuweb.github.io/gpuweb/#feature-index) trong thông số kỹ thuật
