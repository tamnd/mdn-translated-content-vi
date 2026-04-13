---
title: "GPUCommandEncoder: beginRenderPass() method"
short-title: beginRenderPass()
slug: Web/API/GPUCommandEncoder/beginRenderPass
page-type: web-api-instance-method
browser-compat: api.GPUCommandEncoder.beginRenderPass
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`beginRenderPass()`** của giao diện {{domxref("GPUCommandEncoder")}} bắt đầu mã hóa một render pass, trả về một {{domxref("GPURenderPassEncoder")}} có thể dùng để điều khiển quá trình kết xuất.

## Cú pháp

```js-nolint
beginRenderPass(descriptor)
```

### Tham số

- `descriptor`
  - : Một đối tượng chứa các thuộc tính sau:
    - `colorAttachments`
      - : Một mảng các đối tượng (xem [Color attachment object structure](#color_attachment_object_structure)) xác định các color attachment sẽ được xuất ra khi thực thi render pass này.
    - `depthStencilAttachment` {{optional_inline}}
      - : Một đối tượng (xem [Depth/stencil attachment object structure](#depthstencil_attachment_object_structure)) xác định depth/stencil attachment sẽ được xuất ra và được kiểm tra khi thực thi render pass này.
    - `label` {{optional_inline}}
      - : Một chuỗi dùng làm nhãn để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo trên console.
    - `maxDrawCount` {{optional_inline}}
      - : Một số cho biết số lượng lệnh vẽ tối đa sẽ được thực hiện trong render pass. Một số triển khai dùng giá trị này để tính kích thước phần việc được chèn trước render pass. Bạn nên giữ giá trị mặc định - `50000000` - trừ khi biết chắc sẽ có nhiều lệnh vẽ hơn.
    - `occlusionQuerySet` {{optional_inline}}
      - : {{domxref("GPUQuerySet")}} sẽ lưu kết quả truy vấn che khuất cho pass này.
    - `timestampWrites` {{optional_inline}}
      - : Một mảng các đối tượng xác định nơi và thời điểm các giá trị truy vấn dấu thời gian sẽ được ghi cho pass này. Các đối tượng này có các thuộc tính sau:
        - `querySet`
          - : Một {{domxref("GPUQuerySet")}} kiểu `"timestamp"` mà kết quả truy vấn dấu thời gian sẽ được ghi vào.
        - `beginningOfPassWriteIndex`
          - : Một số chỉ định chỉ mục truy vấn trong `querySet` nơi dấu thời gian ở đầu render pass sẽ được ghi. Thuộc tính này là tùy chọn - nếu không được định nghĩa, sẽ không có dấu thời gian nào được ghi cho đầu pass.
        - `endOfPassWriteIndex`
          - : Một số chỉ định chỉ mục truy vấn trong `querySet` nơi dấu thời gian ở cuối render pass sẽ được ghi. Thuộc tính này là tùy chọn - nếu không được định nghĩa, sẽ không có dấu thời gian nào được ghi cho cuối pass.

        > [!NOTE]
        > Tính năng `timestamp-query` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) cần được bật để dùng truy vấn dấu thời gian. Giá trị truy vấn dấu thời gian được ghi bằng nanosecond, nhưng cách xác định giá trị là do phần triển khai quyết định.

### Cấu trúc đối tượng color attachment

Các đối tượng color attachment có thể có các thuộc tính sau:

- `clearValue` {{optional_inline}}
  - : Một giá trị màu để xóa texture `view` trước khi thực thi render pass. Giá trị này bị bỏ qua nếu `loadOp` không được đặt thành `"clear"`. `clearValue` nhận một mảng hoặc đối tượng biểu diễn bốn thành phần màu `r`, `g`, `b`, và `a` dưới dạng số thập phân.

    Ví dụ, bạn có thể truyền một mảng như `[0.0, 0.5, 1.0, 1.0]`, hoặc đối tượng tương đương `{ r: 0.0, g: 0.5, b: 1.0, a: 1.0 }`.

    Nếu bỏ qua `clearValue`, nó sẽ mặc định là `{ r: 0, g: 0, b: 0, a: 0 }`.

- `depthSlice` {{optional_inline}}
  - : Một số biểu diễn chỉ mục của lát cắt chiều sâu 3D sẽ được xuất ra cho color attachment này, trong trường hợp `view` là một {{domxref("GPUTextureView")}} 3D. Khi được chỉ định, thuộc tính này cho phép WebGPU kết xuất trực tiếp vào các lát cắt của texture 3D trong render pass.

- `loadOp`
  - : Một giá trị liệt kê cho biết thao tác tải sẽ thực hiện trên `view` trước khi render pass chạy. Các giá trị có thể là:
    - `"clear"`: Tải `clearValue` của attachment này vào render pass.
    - `"load"`: Tải giá trị hiện có của attachment này vào render pass.

    > [!NOTE]
    > Nên luôn dùng `"clear"` trong các trường hợp giá trị ban đầu không quan trọng, vì điều này sẽ cho hiệu năng tốt hơn trên một số thiết bị như thiết bị di động.

- `storeOp`
  - : Một giá trị liệt kê cho biết thao tác lưu sẽ thực hiện trên `view` sau khi render pass chạy. Các giá trị có thể là:
    - `"discard"`: Bỏ giá trị kết quả của render pass cho attachment này.
    - `"store"`: Lưu giá trị kết quả của render pass cho attachment này.
- `resolveTarget` {{optional_inline}}
  - : Một đối tượng biểu diễn texture subresource sẽ nhận đầu ra đã được resolve cho color attachment này nếu `view` là multisampled. Đây có thể là một trong các giá trị sau:
    - {{domxref("GPUTextureView")}}
    - {{domxref("GPUTexture")}}: Có thể dùng thay cho `GPUTextureView` nếu muốn một view mặc định. Khi dùng trong ngữ cảnh này, `GPUTexture` tương đương với một đối tượng `GPUTextureView` được tạo bằng lệnh gọi {{domxref("GPUTexture.createView()")}} mà không truyền đối số.
- `view`
  - : Một đối tượng biểu diễn texture subresource sẽ được xuất ra cho color attachment này. Đây có thể là một trong các giá trị sau:
    - {{domxref("GPUTextureView")}}
    - {{domxref("GPUTexture")}}: Có thể dùng thay cho `GPUTextureView` nếu muốn một view mặc định. Khi dùng trong ngữ cảnh này, `GPUTexture` tương đương với một đối tượng `GPUTextureView` được tạo bằng lệnh gọi {{domxref("GPUTexture.createView()")}} mà không truyền đối số.

    > [!NOTE]
    > Mỗi color attachment hoặc depth/stencil attachment phải là một texture subresource duy nhất, và các texture subresource được dùng làm attachment không thể được dùng bên trong render pass.

### Cấu trúc đối tượng depth/stencil attachment

Đối tượng `depthStencilAttachment` có thể có các thuộc tính sau:

- `depthClearValue` {{optional_inline}}
  - : Một số cho biết giá trị để xóa thành phần độ sâu của `view` trước khi render pass chạy. Giá trị này bị bỏ qua nếu `depthLoadOp` không được đặt thành `"clear"`.

    Giá trị phải nằm trong khoảng từ 0.0 đến 1.0, bao gồm cả hai đầu.

- `depthLoadOp` {{optional_inline}}
  - : Một giá trị liệt kê cho biết thao tác tải sẽ thực hiện trên thành phần độ sâu của `view` trước khi render pass chạy. Các giá trị có thể là:
    - `"clear"`: Tải `clearValue` của attachment này vào render pass.
    - `"load"`: Tải giá trị hiện có của attachment này vào render pass.

    > [!NOTE]
    > Nên luôn dùng `"clear"` trong các trường hợp giá trị ban đầu không quan trọng, vì điều này sẽ cho hiệu năng tốt hơn trên một số thiết bị như thiết bị di động.

- `depthReadOnly` {{optional_inline}}
  - : Một giá trị boolean. Đặt thành `true` sẽ khiến thành phần độ sâu của `view` chỉ có thể đọc. Nếu bỏ qua `depthReadOnly`, nó mặc định là `false`.
- `depthStoreOp` {{optional_inline}}
  - : Một giá trị liệt kê cho biết thao tác lưu sẽ thực hiện trên thành phần độ sâu của `view` sau khi render pass chạy. Các giá trị có thể là:
    - `"discard"`: Bỏ giá trị kết quả của render pass cho attachment này.
    - `"store"`: Lưu giá trị kết quả của render pass cho attachment này.
- `stencilClearValue` {{optional_inline}}
  - : Một số cho biết giá trị để xóa thành phần stencil của `view` trước khi render pass chạy. Giá trị này bị bỏ qua nếu `stencilLoadOp` không được đặt thành `"clear"`.

    Nếu bỏ qua `stencilClearValue`, nó mặc định là 0.

- `stencilLoadOp` {{optional_inline}}
  - : Một giá trị liệt kê cho biết thao tác tải sẽ thực hiện trên thành phần stencil của `view` trước khi render pass chạy. Các giá trị có thể là:
    - `"clear"`: Tải `clearValue` của attachment này vào render pass.
    - `"load"`: Tải giá trị hiện có của attachment này vào render pass.

    > [!NOTE]
    > Nên luôn dùng `"clear"` trong các trường hợp giá trị ban đầu không quan trọng, vì điều này sẽ cho hiệu năng tốt hơn trên một số thiết bị như thiết bị di động.

- `stencilReadOnly` {{optional_inline}}
