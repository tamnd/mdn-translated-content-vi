---
title: Worklet
slug: Web/API/Worklet
page-type: web-api-interface
browser-compat: api.Worklet
---

{{APIRef("Worklets")}}{{SecureContext_Header}}

Giao diện **`Worklet`** là phiên bản nhẹ của [Web Workers](/en-US/docs/Web/API/Web_Workers_API) và cho phép nhà phát triển truy cập vào các phần cấp thấp của quy trình kết xuất.

Với Worklets, bạn có thể chạy mã JavaScript và [WebAssembly](/en-US/docs/WebAssembly) để thực hiện kết xuất đồ họa hoặc xử lý âm thanh khi hiệu suất cao là yêu cầu bắt buộc.

Worklets cho phép nhập tĩnh [mô-đun ECMAScript](/en-US/docs/Web/JavaScript/Guide/Modules), nếu được hỗ trợ, bằng cách dùng [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import).
Nhập động bị đặc tả cấm, gọi [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import) sẽ ném ra lỗi.

## Các loại Worklet

Worklets bị giới hạn trong các trường hợp sử dụng cụ thể; chúng không thể được sử dụng cho các phép tính tùy ý như Web Workers. Giao diện `Worklet` trừu tượng hóa các thuộc tính và phương thức chung cho mọi loại worklet, và không thể được tạo trực tiếp. Thay vào đó, bạn có thể sử dụng một trong các lớp sau:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Tên</th>
      <th>Mô tả</th>
      <th>Vị trí</th>
      <th>Đặc tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref("AudioWorklet")}}</td>
      <td>Dùng để xử lý âm thanh với AudioNodes tùy chỉnh.</td>
      <td>Luồng kết xuất Web Audio</td>
      <td>
        <a href="https://webaudio.github.io/web-audio-api/#AudioWorklet"
          >Web Audio API</a
        >
      </td>
    </tr>
    <tr>
      <td>{{domxref("AnimationWorklet")}}</td>
      <td>
        Dùng để tạo các hoạt ảnh liên kết với cuộn trang và các hoạt ảnh thủ tục hiệu suất cao khác.
      </td>
      <td>Luồng compositor</td>
      <td>
        <a href="https://wicg.github.io/animation-worklet/"
          >CSS Animation Worklet API</a
        >
      </td>
    </tr>
    <tr>
      <td>{{domxref("LayoutWorklet")}}</td>
      <td>Dùng để định nghĩa vị trí và kích thước của các phần tử tùy chỉnh.</td>
      <td></td>
      <td>
        <a
          href="https://drafts.css-houdini.org/css-layout-api-1/#layout-worklet"
          >CSS Layout API</a
        >
      </td>
    </tr>
    <tr>
      <td>{{domxref("SharedStorageWorklet")}}</td>
      <td>Dùng để chạy các thao tác riêng tư trên dữ liệu nhiều trang web, không có nguy cơ rò rỉ dữ liệu.</td>
      <td>Luồng chính</td>
      <td>
        <a
          href="https://wicg.github.io/shared-storage/"
          >Shared Storage API</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Paint worklets, được định nghĩa bởi [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API), không kế thừa từ `Worklet`. Chúng được truy cập thông qua một đối tượng `Worklet` thông thường thu được bằng {{DOMxref("CSS.paintWorklet_static", "CSS.paintWorklet")}}.

Để kết xuất 3D với [WebGL](/en-US/docs/Web/API/WebGL_API), bạn không sử dụng worklets. Thay vào đó, bạn viết vertex shader và fragment shader bằng mã GLSL, và các shader đó sẽ chạy trên card đồ họa.

## Thuộc tính phiên bản

_Giao diện Worklet không định nghĩa bất kỳ thuộc tính nào._

## Phương thức phiên bản

- {{domxref("Worklet.addModule()")}}
  - : Thêm mô-đun script tại URL đã cho vào worklet hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Houdini: Demystifying CSS](https://developer.chrome.com/docs/css-ui/houdini) trên Google Developers (2016)
- [AudioWorklet :: What, Why, and How](https://www.youtube.com/watch?v=g1L4O1smMC0&t=1m33s) trên YouTube (2017)
- [Enter AudioWorklet](https://developer.chrome.com/blog/audio-worklet/) trên Google Developers (2017)
- [Animation Worklet - HTTP203 Advent](https://www.youtube.com/watch?v=ZPkMMShYxKU&t=0m19s) trên YouTube (2017)
