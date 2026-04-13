---
title: WGSLLanguageFeatures
slug: Web/API/WGSLLanguageFeatures
page-type: web-api-interface
browser-compat: api.WGSLLanguageFeatures
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`WGSLLanguageFeatures`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} là một đối tượng [giống set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) báo cáo các [phần mở rộng ngôn ngữ WGSL](https://gpuweb.github.io/gpuweb/wgsl/#language-extension) được hỗ trợ bởi triển khai WebGPU.

Đối tượng `WGSLLanguageFeatures` được truy cập qua thuộc tính {{domxref("GPU.wgslLanguageFeatures")}}.

> [!NOTE]
> Không phải tất cả các phần mở rộng ngôn ngữ WGSL đều có sẵn cho WebGPU trong tất cả các trình duyệt hỗ trợ API. Chúng tôi khuyến nghị bạn kiểm tra kỹ lưỡng bất kỳ phần mở rộng nào bạn chọn sử dụng.

{{InheritanceDiagram}}

## Các tính năng có sẵn

Các phần mở rộng ngôn ngữ WGSL sau được định nghĩa tại [WGSL language extensions](https://gpuweb.github.io/gpuweb/wgsl/#language-extension) trong đặc tả WGSL. Hãy nhớ rằng tập hợp tính năng chính xác có sẵn sẽ khác nhau tùy theo các triển khai và thiết bị vật lý, và có thể thay đổi theo thời gian.

- `packed_4x8_integer_dot_product`
  - : Cho phép sử dụng các lệnh GPU **DP4a** (Dot Product of 4 Elements and Accumulate) thông qua mã WGSL của bạn. Chúng thực hiện hiệu quả các phép dot product số nguyên 8-bit để tăng tốc tính toán, tiết kiệm bộ nhớ và băng thông mạng, cải thiện hiệu suất so với các phiên bản `f32` tương đương. Chúng thường được sử dụng trong các mô hình học máy trong suy luận, trong các framework AI.

    Cụ thể, khi `packed_4x8_integer_dot_product` có sẵn, mã WGSL có thể sử dụng:
    - Các scalar số nguyên 32-bit đóng gói 4 thành phần vector của số nguyên 8-bit để được sử dụng làm đầu vào cho các lệnh dot product (thông qua các hàm tích hợp `dot4U8Packed()` và `dot4I8Packed()`).
    - Các lệnh đóng gói và giải nén với các vector 4 thành phần đóng gói của số nguyên 8-bit (thông qua các hàm tích hợp như `pack4xI8()` và `pack4xI8Clamp()`).

- `pointer_composite_access`
  - : Cho phép mã shader WGSL truy cập các thành phần của các kiểu dữ liệu phức tạp bằng cú pháp dấu chấm (`.`) giống nhau dù bạn đang làm việc trực tiếp với dữ liệu hay với con trỏ đến nó.

    Khi `pointer_composite_access` có sẵn:
    - Nếu `foo` là con trỏ: `foo.bar` có sẵn như một cách thuận tiện hơn để viết `(*foo).bar`. Dấu hoa thị (`*`) thông thường cần thiết để chuyển con trỏ thành "tham chiếu" có thể được giải tham chiếu, nhưng giờ đây cả con trỏ và tham chiếu gần như có thể hoán đổi cho nhau.
    - Nếu `foo` không phải là con trỏ: Toán tử dấu chấm (`.`) hoạt động chính xác như bạn đã quen để truy cập trực tiếp các thành viên.
    - Nếu `pa` là con trỏ lưu trữ địa chỉ bắt đầu của mảng, thì `pa[i]` cung cấp cho bạn truy cập trực tiếp vào vị trí bộ nhớ nơi phần tử thứ `i` của mảng đó được lưu trữ.

    Xem [Cú pháp đường tắt cho việc giải tham chiếu composite trong WGSL](https://developer.chrome.com/blog/new-in-webgpu-123#syntax_sugar_for_dereferencing_composites_in_wgsl) để biết thêm chi tiết và ví dụ.

- `readonly_and_readwrite_storage_textures`
  - : Khi có sẵn, cho phép đặt các giá trị `"read-only"` và `"read-write"` [`storageTexture.access`](/en-US/docs/Web/API/GPUDevice/createBindGroupLayout#access) khi chỉ định các loại mục nhập bind group texture lưu trữ trong bind group layout. Chúng cho phép mã WGSL đọc texture lưu trữ, và đọc/ghi texture lưu trữ, tương ứng.

- `subgroup_id`
  - : Khi có sẵn, các giá trị tích hợp WGSL [`subgroup_id`](https://gpuweb.github.io/gpuweb/wgsl/#built-in-values-subgroup_id) và [`num_subgroups`](https://gpuweb.github.io/gpuweb/wgsl/#built-in-values-num_subgroups) có thể sử dụng trong các compute shader. Chúng cải thiện quá trình lên lịch công việc trên các subgroup, bằng cách lập chỉ mục bộ nhớ để tránh các truy cập bộ nhớ chồng chéo. Xem [Phần mở rộng subgroup_id WGSL](https://developer.chrome.com/blog/new-in-webgpu-144#wgsl_subgroup_id_extension) để biết thêm chi tiết.
    > [!NOTE]
    > Để tính năng WGSL `subgroup_id` có thể sử dụng được, phần mở rộng [`subgroups`](https://gpuweb.github.io/gpuweb/wgsl/#extension-subgroups) cần được bật trong {{domxref("GPUDevice")}} (xem {{domxref("GPUSupportedFeatures")}}).

- `uniform_buffer_standard_layout`
  - : Khi có sẵn, các uniform buffer sử dụng cùng [ràng buộc bố cục bộ nhớ](https://gpuweb.github.io/gpuweb/wgsl/#address-space-layout-constraints) như các storage buffer, điều này giúp dễ dàng chia sẻ các cấu trúc dữ liệu trên cả hai loại buffer. Điều này có nghĩa là các uniform buffer không còn cần phải có căn chỉnh 16 byte trên các phần tử mảng, hoặc đệm các offset cấu trúc lồng nhau thành bội số của 16 byte.

    Xem [Phần mở rộng uniform_buffer_standard_layout WGSL](https://developer.chrome.com/blog/new-in-webgpu-144#wgsl_uniform_buffer_standard_layout_extension) để biết thêm chi tiết.

- `unrestricted_pointer_parameters`
  - : Nới lỏng các hạn chế đối với con trỏ được truyền vào các hàm WGSL. Khi có sẵn, các điều sau được phép:
    - Con trỏ tham số vào các không gian địa chỉ lưu trữ, uniform và workgroup được truyền vào các hàm do người dùng khai báo.
    - Con trỏ đến các thành viên cấu trúc và phần tử mảng được truyền vào các hàm do người dùng khai báo.

      Xem [Con trỏ Như Tham số Hàm](https://google.github.io/tour-of-wgsl/types/pointers/passing_pointers/) để biết thêm chi tiết.

## Thuộc tính phiên bản

Các thuộc tính sau có sẵn cho tất cả các đối tượng [giống set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) chỉ đọc:

- {{jsxref("Set.prototype.size", "size")}}
  - : Trả về số lượng giá trị trong set.

## Phương thức phiên bản

Các phương thức sau có sẵn cho tất cả các đối tượng [giống set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) chỉ đọc:

- {{jsxref("Set.prototype.has()", "has()")}}
  - : Trả về một boolean khẳng định có hay không một phần tử có giá trị đã cho có trong set.
- {{jsxref("Set.prototype.values()", "values()")}}
  - : Trả về một đối tượng iterator mới tạo ra các **giá trị** cho mỗi phần tử trong set theo thứ tự chèn.
- {{jsxref("Set.prototype.keys()", "keys()")}}
  - : Bí danh cho {{jsxref("Set.prototype.values()", "values()")}}.
- {{jsxref("Set.prototype.entries()", "entries()")}}
  - : Trả về một đối tượng iterator mới chứa **một mảng `[value, value]`** cho mỗi phần tử trong set theo thứ tự chèn.
- {{jsxref("Set.prototype.forEach()", "forEach()")}}
  - : Gọi hàm callback được cung cấp một lần cho mỗi giá trị có trong set theo thứ tự chèn.

## Ví dụ

### Kiểm tra xem phần mở rộng có sẵn không

```js
if (
  navigator.gpu.wgslLanguageFeatures.has(
    "readonly_and_readwrite_storage_textures",
  )
) {
  console.log("Read-only and read-write storage textures are available");
}
```

### Trả về kích thước set và lặp qua các giá trị

```js
const wgslFeatures = navigator.gpu.wgslLanguageFeatures;

// Return the size of the set
console.log(wgslFeatures.size);

// Iterate through all the set values using values()
const valueIterator = wgslFeatures.values();
for (const value of valueIterator) {
  console.log(value);
}

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
