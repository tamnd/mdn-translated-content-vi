---
title: Khái niệm WebAssembly
slug: WebAssembly/Guides/Concepts
page-type: guide
sidebar: webassemblysidebar
---

Bài viết này giải thích các khái niệm đằng sau cách WebAssembly hoạt động, bao gồm mục tiêu của nó, các vấn đề nó giải quyết, và cách nó chạy bên trong engine JavaScript của trình duyệt web.

## WebAssembly là gì?

WebAssembly (viết tắt là _Wasm_) là định dạng bytecode cấp thấp ban đầu được thiết kế cho web. Nó không được thiết kế chủ yếu để viết bằng tay, mà được thiết kế để là một mục tiêu biên dịch hiệu quả cho các ngôn ngữ nguồn như C, C++, Rust, v.v.

Điều này có ý nghĩa lớn đối với nền tảng web — nó cung cấp một cách để chạy code được viết bằng nhiều ngôn ngữ trên web với tốc độ gần native, với các ứng dụng client chạy trên web mà trước đây không thể làm được.

Hơn nữa, bạn thậm chí không cần phải biết cách tạo code WebAssembly để tận dụng nó. Các mô-đun WebAssembly có thể được nhập khẩu vào một ứng dụng web (hoặc Node.js), hiển thị các hàm WebAssembly để sử dụng thông qua JavaScript. Các framework JavaScript có thể sử dụng WebAssembly để mang lại lợi thế hiệu suất khổng lồ và các tính năng mới trong khi vẫn làm cho chức năng dễ dàng có sẵn cho các nhà phát triển web.

## Mục tiêu của WebAssembly

WebAssembly là một tiêu chuẩn mở được phát triển bên trong [W3C WebAssembly Community Group](https://www.w3.org/community/webassembly/) với các mục tiêu sau:

- Nhanh, hiệu quả và di động — Code WebAssembly có thể được thực thi với tốc độ gần native trên các nền tảng khác nhau bằng cách tận dụng [khả năng phần cứng phổ biến](https://webassembly.org/docs/portability/#assumptions-for-efficient-execution).
- Có thể đọc và debug được — WebAssembly là ngôn ngữ hợp ngữ cấp thấp, nhưng nó có định dạng văn bản có thể đọc được bởi con người (đặc tả cho điều này vẫn đang được hoàn thiện) cho phép code được viết, xem và debug bằng tay.
- Bảo mật — WebAssembly được chỉ định để chạy trong môi trường thực thi an toàn, sandbox. Giống như các code web khác, nó sẽ thực thi chính sách same-origin và permissions của trình duyệt.
- Không phá vỡ web — WebAssembly được thiết kế sao cho nó phối hợp tốt với các công nghệ web khác và duy trì khả năng tương thích ngược.

> [!NOTE]
> Mặc dù WebAssembly ban đầu được thiết kế cho web, nó có nhiều ứng dụng bên ngoài trình duyệt và môi trường JavaScript (xem [Non-web embeddings](https://webassembly.org/docs/non-web/)).

## WebAssembly phù hợp với nền tảng web như thế nào?

Nền tảng web có thể được coi là có hai phần:

- Một máy ảo (VM) chạy code của ứng dụng Web, ví dụ: code JavaScript cung cấp năng lượng cho các ứng dụng của bạn.
- Một tập hợp [Web API](/en-US/docs/Web/API) mà ứng dụng Web có thể gọi để kiểm soát chức năng trình duyệt web/thiết bị và làm cho mọi thứ xảy ra ([DOM](/en-US/docs/Web/API/Document_Object_Model), [CSSOM](/en-US/docs/Web/API/CSS_Object_Model), [WebGL](/en-US/docs/Web/API/WebGL_API), [IndexedDB](/en-US/docs/Web/API/IndexedDB_API), [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), v.v.).

Trước đây, VM chỉ có thể tải JavaScript. Điều này đã hoạt động tốt với chúng ta vì JavaScript đủ mạnh để giải quyết hầu hết các vấn đề mà mọi người gặp phải trên Web ngày nay. Tuy nhiên, chúng ta đã gặp phải các vấn đề về hiệu suất khi cố gắng sử dụng JavaScript cho các trường hợp sử dụng chuyên sâu hơn như trò chơi 3D, Thực tế ảo và Thực tế tăng cường, nhận thức máy tính, chỉnh sửa hình ảnh/video và một số lĩnh vực khác đòi hỏi hiệu suất native (xem [Trường hợp sử dụng WebAssembly](https://webassembly.org/docs/use-cases/) để biết thêm ý tưởng).

Ngoài ra, chi phí tải xuống, phân tích cú pháp và biên dịch các ứng dụng JavaScript rất lớn có thể rất tốn kém. Di động và các nền tảng bị hạn chế tài nguyên khác có thể khuếch đại thêm các nút thắt hiệu suất này.

WebAssembly là một ngôn ngữ khác với JavaScript, nhưng nó không có nghĩa là thay thế. Thay vào đó, nó được thiết kế để bổ sung và làm việc cùng với JavaScript, cho phép các nhà phát triển web tận dụng điểm mạnh của cả hai ngôn ngữ:

- JavaScript là ngôn ngữ cấp cao, đủ linh hoạt và biểu đạt để viết các ứng dụng web. Nó có nhiều lợi thế — nó được đánh máy động, không yêu cầu bước biên dịch và có một hệ sinh thái khổng lồ cung cấp các framework, thư viện và công cụ mạnh mẽ.
- WebAssembly là ngôn ngữ giống hợp ngữ cấp thấp với định dạng nhị phân nhỏ gọn chạy với hiệu suất gần native và cung cấp cho các ngôn ngữ có mô hình bộ nhớ cấp thấp như C++ và Rust một mục tiêu biên dịch để chúng có thể chạy trên web. (Lưu ý rằng WebAssembly có [mục tiêu cấp cao](https://webassembly.org/docs/high-level-goals/) là hỗ trợ các ngôn ngữ có mô hình bộ nhớ được thu gom rác trong tương lai.)

Với sự xuất hiện của WebAssembly trong các trình duyệt, máy ảo mà chúng ta đã nói trước đó bây giờ sẽ tải và chạy hai loại code — JavaScript VÀ WebAssembly.

Các loại code khác nhau có thể gọi nhau khi cần — [JavaScript API WebAssembly](/en-US/docs/WebAssembly/Reference/JavaScript_interface) bao bọc code WebAssembly được xuất khẩu với các hàm JavaScript có thể được gọi bình thường, và code WebAssembly có thể nhập khẩu và đồng bộ gọi các hàm JavaScript thông thường. Trên thực tế, đơn vị cơ bản của code WebAssembly được gọi là mô-đun và các mô-đun WebAssembly có nhiều điểm đối xứng với các mô-đun ES.

### Các khái niệm chính của WebAssembly

Có một số khái niệm chính cần thiết để hiểu cách WebAssembly chạy trong trình duyệt. Tất cả các khái niệm này được phản ánh 1:1 trong [JavaScript API WebAssembly](/en-US/docs/WebAssembly/Reference/JavaScript_interface).

- **Mô-đun (Module)**: Đại diện cho một nhị phân WebAssembly đã được trình duyệt biên dịch thành mã máy có thể thực thi. Một Mô-đun là stateless và do đó, giống như một [`Blob`](/en-US/docs/Web/API/Blob), có thể được chia sẻ rõ ràng giữa các cửa sổ và worker (thông qua [`postMessage()`](/en-US/docs/Web/API/MessagePort/postMessage)). Một Mô-đun khai báo nhập khẩu và xuất khẩu giống như một mô-đun ES.
- **Bộ nhớ (Memory)**: Một ArrayBuffer có thể thay đổi kích thước chứa mảng byte tuyến tính được đọc và viết bởi các lệnh truy cập bộ nhớ cấp thấp của WebAssembly.
- **Bảng (Table)**: Một mảng được đánh máy có thể thay đổi kích thước của các tham chiếu (ví dụ: đến các hàm) mà không thể được lưu trữ dưới dạng byte thô trong Bộ nhớ (vì lý do an toàn và di động).
- **Phiên bản (Instance)**: Một Mô-đun được ghép cặp với tất cả trạng thái nó sử dụng lúc chạy bao gồm một Bộ nhớ, Bảng và tập hợp các giá trị được nhập khẩu. Một Phiên bản giống như một mô-đun ES đã được tải vào một global cụ thể với một tập hợp nhập khẩu cụ thể.

JavaScript API cung cấp cho các nhà phát triển khả năng tạo các mô-đun, bộ nhớ, bảng và phiên bản. Với một phiên bản WebAssembly, code JavaScript có thể đồng bộ gọi các xuất khẩu của nó, được hiển thị dưới dạng các hàm JavaScript thông thường. Các hàm JavaScript tùy ý cũng có thể được đồng bộ gọi bởi code WebAssembly bằng cách truyền các hàm JavaScript đó làm nhập khẩu vào một phiên bản WebAssembly.

Vì JavaScript có toàn quyền kiểm soát cách code WebAssembly được tải xuống, biên dịch và chạy, các nhà phát triển JavaScript thậm chí có thể coi WebAssembly như chỉ là một tính năng JavaScript để tạo hiệu quả các hàm hiệu suất cao.

Trong tương lai, các mô-đun WebAssembly sẽ [có thể tải giống như các mô-đun ES](https://github.com/WebAssembly/proposals/issues/12) (sử dụng `<script type='module'>`), có nghĩa là JavaScript sẽ có thể tải, biên dịch và nhập khẩu một mô-đun WebAssembly dễ dàng như một mô-đun ES.

## Làm thế nào tôi có thể sử dụng WebAssembly trong ứng dụng của mình?

Ở trên chúng ta đã nói về các nguyên thủy thô mà WebAssembly thêm vào nền tảng Web: định dạng nhị phân cho code và các API để tải và chạy code nhị phân này. Bây giờ hãy nói về cách chúng ta có thể sử dụng các nguyên thủy này trong thực tế.

Hệ sinh thái WebAssembly đang ở giai đoạn sơ khai; nhiều công cụ chắc chắn sẽ xuất hiện về phía trước. Hiện tại, có bốn điểm vào chính:

- Chuyển cổng ứng dụng C/C++ với [Emscripten](https://emscripten.org/).
- Viết hoặc tạo WebAssembly trực tiếp ở cấp độ hợp ngữ.
- Viết ứng dụng Rust và nhắm mục tiêu WebAssembly là đầu ra của nó.
- Sử dụng [AssemblyScript](https://www.assemblyscript.org/) trông giống TypeScript và biên dịch thành nhị phân WebAssembly.

Hãy nói về các tùy chọn này:

### Chuyển cổng từ C/C++

Hai trong số nhiều tùy chọn để tạo code Wasm là một bộ lắp ráp Wasm trực tuyến hoặc [Emscripten](https://emscripten.org/). Có một số lựa chọn bộ lắp ráp Wasm trực tuyến, chẳng hạn như:

- [WasmFiddle++](https://anonyco.github.io/WasmFiddlePlusPlus/)
- [WasmExplorer](https://mbebenita.github.io/WasmExplorer/)

Đây là các tài nguyên tuyệt vời cho những người đang cố gắng tìm ra nơi để bắt đầu, nhưng chúng thiếu một số công cụ và tối ưu hóa của Emscripten.

Công cụ Emscripten có thể lấy hầu hết mọi mã nguồn C/C++ và biên dịch nó thành mô-đun Wasm, cùng với code JavaScript "glue" cần thiết để tải và chạy mô-đun, và một tài liệu HTML để hiển thị kết quả của code.

![Sơ đồ: Emscripten biên dịch mã nguồn C/C++ thành mô-đun Wasm, một tài liệu HTML cùng với code JavaScript glue.](emscripten-diagram.png)

Tóm lại, quy trình hoạt động như sau:

1. Emscripten đầu tiên đưa C/C++ vào clang+LLVM — một toolchain trình biên dịch C/C++ mã nguồn mở trưởng thành, được vận chuyển như một phần của Xcode trên macOS chẳng hạn.
2. Emscripten chuyển đổi kết quả đã biên dịch của clang+LLVM thành nhị phân Wasm.
3. Bản thân nó, WebAssembly hiện không thể trực tiếp truy cập DOM; nó chỉ có thể gọi JavaScript, truyền vào các kiểu dữ liệu nguyên thủy số nguyên và số thực. Do đó, để truy cập bất kỳ Web API nào, WebAssembly cần gọi ra JavaScript, cái sau đó thực hiện cuộc gọi Web API. Emscripten do đó tạo ra code HTML và JavaScript glue cần thiết để đạt được điều này.

> [!NOTE]
> Có kế hoạch trong tương lai để [cho phép WebAssembly gọi trực tiếp Web API](https://github.com/WebAssembly/gc/blob/master/README.md).

Code JavaScript glue không đơn giản như bạn có thể tưởng tượng. Để bắt đầu, Emscripten triển khai các thư viện C/C++ phổ biến như [SDL](https://en.wikipedia.org/wiki/Simple_DirectMedia_Layer), [OpenGL](https://en.wikipedia.org/wiki/OpenGL), [OpenAL](https://en.wikipedia.org/wiki/OpenAL), và các phần của [POSIX](https://en.wikipedia.org/wiki/POSIX). Các thư viện này được triển khai theo các Web API và do đó mỗi thư viện yêu cầu một số code JavaScript glue để kết nối WebAssembly với Web API cơ bản.

Vì vậy, một phần của code glue là triển khai chức năng của mỗi thư viện tương ứng được sử dụng bởi code C/C++. Code glue cũng chứa logic để gọi các JavaScript API WebAssembly đã đề cập ở trên để tải, tải và chạy tệp Wasm.

Tài liệu HTML được tạo tải tệp JavaScript glue và ghi stdout vào một {{htmlelement("textarea")}}. Nếu ứng dụng sử dụng OpenGL, HTML cũng chứa một phần tử {{htmlelement("canvas")}} được sử dụng làm mục tiêu kết xuất. Rất dễ dàng để sửa đổi đầu ra Emscripten và biến nó thành bất kỳ ứng dụng web nào bạn yêu cầu.

Bạn có thể tìm thấy tài liệu đầy đủ về Emscripten tại [emscripten.org](https://emscripten.org/), và hướng dẫn triển khai toolchain và biên dịch ứng dụng C/C++ của riêng bạn sang Wasm tại [Biên dịch từ C/C++ sang WebAssembly](/en-US/docs/WebAssembly/Guides/C_to_Wasm).

### Viết WebAssembly trực tiếp

Bạn có muốn xây dựng trình biên dịch của riêng mình, hoặc công cụ của riêng bạn, hoặc tạo một thư viện JavaScript tạo WebAssembly lúc chạy không?

Tương tự như các ngôn ngữ hợp ngữ vật lý, định dạng nhị phân WebAssembly có biểu diễn văn bản — hai cái có tương ứng 1:1. Bạn có thể viết hoặc tạo định dạng này bằng tay và sau đó chuyển đổi nó sang định dạng nhị phân với bất kỳ [công cụ chuyển đổi văn bản sang nhị phân WebAssembly](https://webassembly.org/getting-started/advanced-tools/) nào.

Để có hướng dẫn đơn giản về cách làm điều này, hãy xem bài viết [Chuyển đổi định dạng văn bản WebAssembly sang Wasm](/en-US/docs/WebAssembly/Guides/Text_format_to_Wasm) của chúng tôi.

### Viết Rust nhắm mục tiêu WebAssembly

Cũng có thể viết code Rust và biên dịch sang WebAssembly, nhờ vào công sức không mệt mỏi của Rust WebAssembly Working Group. Bạn có thể bắt đầu với việc cài đặt toolchain cần thiết, biên dịch một chương trình Rust mẫu sang gói npm WebAssembly và sử dụng nó trong một ứng dụng web mẫu, tại bài viết [Biên dịch từ Rust sang WebAssembly](/en-US/docs/WebAssembly/Guides/Rust_to_Wasm) của chúng tôi.

### Sử dụng AssemblyScript

Đối với các nhà phát triển web muốn thử WebAssembly mà không cần tìm hiểu chi tiết về C hoặc Rust, ở lại trong sự thoải mái của một ngôn ngữ quen thuộc như TypeScript, AssemblyScript sẽ là lựa chọn tốt nhất. AssemblyScript biên dịch một biến thể nghiêm ngặt của TypeScript sang WebAssembly, cho phép các nhà phát triển web tiếp tục sử dụng công cụ tương thích với TypeScript mà họ đã quen — như Prettier, ESLint, VS Code IntelliSense, v.v. Bạn có thể kiểm tra tài liệu của nó tại <https://www.assemblyscript.org/>.

## Tóm tắt

Bài viết này đã giải thích WebAssembly là gì, tại sao nó hữu ích, cách nó phù hợp với web và cách bạn có thể sử dụng nó.

## Xem thêm

- [Bài viết WebAssembly trên blog Mozilla Hacks](https://hacks.mozilla.org/category/webassembly/)
- [WebAssembly trên Mozilla Research](https://research.mozilla.org/)
- [Tải và chạy code WebAssembly](/en-US/docs/WebAssembly/Guides/Loading_and_running) — tìm hiểu cách tải mô-đun WebAssembly của riêng bạn vào một trang web.
- [Sử dụng JavaScript API WebAssembly](/en-US/docs/WebAssembly/Guides/Using_the_JavaScript_API) — tìm hiểu cách sử dụng các tính năng chính khác của JavaScript API WebAssembly.
