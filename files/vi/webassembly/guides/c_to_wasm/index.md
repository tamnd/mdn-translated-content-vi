---
title: Biên dịch mô-đun C/C++ mới sang WebAssembly
slug: WebAssembly/Guides/C_to_Wasm
page-type: guide
sidebar: webassemblysidebar
---

Khi bạn đã viết một mô-đun code mới bằng ngôn ngữ như C/C++, bạn có thể biên dịch nó thành WebAssembly bằng công cụ như [Emscripten](https://emscripten.org/). Hãy xem cách thức hoạt động của nó.

## Thiết lập môi trường Emscripten

Đầu tiên, hãy thiết lập môi trường phát triển cần thiết.

### Điều kiện tiên quyết

Lấy Emscripten SDK theo các hướng dẫn sau: <https://emscripten.org/docs/getting_started/downloads.html>

## Biên dịch một ví dụ

Sau khi đã thiết lập môi trường, hãy xem cách sử dụng nó để biên dịch một ví dụ C sang Wasm. Có một số tùy chọn có sẵn khi biên dịch với Emscripten, nhưng hai kịch bản chính chúng ta sẽ đề cập là:

- Biên dịch sang Wasm và tạo HTML để chạy code của chúng ta trong đó, cùng với tất cả code JavaScript "glue" cần thiết để chạy Wasm trong môi trường web.
- Biên dịch sang Wasm và chỉ tạo JavaScript.

Chúng ta sẽ xem xét cả hai bên dưới.

### Tạo HTML và JavaScript

Đây là trường hợp đơn giản nhất chúng ta sẽ xem xét, trong đó bạn để emscripten tạo ra mọi thứ bạn cần để chạy code của mình, dưới dạng WebAssembly, trong trình duyệt.

1. Đầu tiên chúng ta cần một ví dụ để biên dịch. Hãy sao chép ví dụ C đơn giản sau và lưu nó vào một tệp có tên `hello.c` trong một thư mục mới trên ổ đĩa cục bộ của bạn:

   ```c
   #include <stdio.h>

   int main() {
       printf("Hello World\n");
       return 0;
   }
   ```

2. Bây giờ, sử dụng cửa sổ terminal bạn đã dùng để vào môi trường trình biên dịch Emscripten, điều hướng đến cùng thư mục với tệp `hello.c` của bạn và chạy lệnh sau:

   ```bash
   emcc hello.c -o hello.html
   ```

Các tùy chọn chúng ta đã truyền vào lệnh như sau:

- `-o hello.html` — Chỉ định rằng chúng ta muốn Emscripten tạo một trang HTML để chạy code của chúng ta (và tên tệp để sử dụng), cũng như mô-đun Wasm và code JavaScript "glue" để biên dịch và khởi tạo Wasm để có thể sử dụng trong môi trường web.

Tại thời điểm này trong thư mục nguồn của bạn, bạn sẽ có:

- Code mô-đun Wasm nhị phân (`hello.wasm`)
- Một tệp JavaScript chứa code glue để dịch giữa các hàm C native, và JavaScript/Wasm (`hello.js`)
- Một tệp HTML để tải, biên dịch và khởi tạo code Wasm của bạn, và hiển thị đầu ra của nó trong trình duyệt (`hello.html`)

### Chạy ví dụ của bạn

Bây giờ tất cả những gì còn lại là bạn tải tệp `hello.html` kết quả trong một trình duyệt hỗ trợ WebAssembly. Tính năng này được kích hoạt theo mặc định từ Firefox 52, Chrome 57, Edge 57, Opera 44.

> [!NOTE]
> Nếu bạn cố gắng mở tệp HTML đã tạo (`hello.html`) trực tiếp từ ổ cứng cục bộ của bạn (ví dụ: `file://your_path/hello.html`), bạn sẽ gặp thông báo lỗi dọc theo dòng _`both async and sync fetching of the wasm failed`._ Bạn cần chạy tệp HTML thông qua máy chủ HTTP (`http://`) — xem [Làm thế nào để thiết lập máy chủ kiểm tra cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) để biết thêm thông tin.

Nếu mọi thứ đã hoạt động như kế hoạch, bạn sẽ thấy đầu ra "Hello world" trong bảng điều khiển Emscripten xuất hiện trên trang web, và bảng điều khiển JavaScript của trình duyệt. Chúc mừng, bạn vừa biên dịch C sang WebAssembly và chạy nó trong trình duyệt!
![image](helloworld.png)

### Sử dụng mẫu HTML tùy chỉnh

Đôi khi bạn sẽ muốn sử dụng mẫu HTML tùy chỉnh. Hãy xem cách chúng ta có thể làm điều này.

1. Trước tiên, lưu code C sau vào một tệp có tên `hello2.c`, trong một thư mục mới:

   ```c
   #include <stdio.h>

   int main() {
       printf("Hello World\n");
       return 0;
   }
   ```

2. Tìm kiếm tệp `shell_minimal.html` trong repo emsdk của bạn. Sao chép nó vào thư mục con có tên `html_template` bên trong thư mục mới trước đó của bạn.
3. Bây giờ điều hướng vào thư mục mới của bạn (một lần nữa, trong cửa sổ terminal môi trường trình biên dịch Emscripten của bạn) và chạy lệnh sau:

   ```bash
   emcc -o hello2.html hello2.c -O3 --shell-file html_template/shell_minimal.html
   ```

   Các tùy chọn chúng ta đã truyền vào lần này hơi khác:
   - Chúng ta đã chỉ định `-o hello2.html`, có nghĩa là trình biên dịch vẫn sẽ xuất ra code JavaScript glue và `.html`.
   - Chúng ta đã chỉ định `-O3`, được sử dụng để tối ưu hóa code. Emcc có các mức độ tối ưu hóa như bất kỳ trình biên dịch C nào khác, bao gồm: `-O0` (không tối ưu hóa), `-O1`, `-O2`, `-Os`, `-Oz`, `-Og`, và `-O3`. `-O3` là cài đặt tốt cho các bản dựng phát hành.
   - Chúng ta cũng đã chỉ định `--shell-file html_template/shell_minimal.html` — điều này cung cấp đường dẫn đến mẫu HTML bạn muốn sử dụng để tạo HTML bạn sẽ chạy ví dụ qua đó.

4. Bây giờ hãy chạy ví dụ này. Lệnh trên sẽ đã tạo `hello2.html`, nội dung sẽ giống với mẫu nhưng với một số code glue được thêm vào để tải Wasm đã tạo, chạy nó, v.v. Mở nó trong trình duyệt và bạn sẽ thấy đầu ra giống như ví dụ trước.

### Biên dịch sang mô-đun JavaScript

Bạn có thể chỉ định xuất chỉ tệp JavaScript "glue" (Emscripten yêu cầu nhiều code JavaScript "glue" để xử lý việc phân bổ bộ nhớ, rò rỉ bộ nhớ và nhiều vấn đề khác) thay vì toàn bộ HTML bằng cách chỉ định tệp .js thay vì tệp HTML trong cờ `-o`, như thế này:

```bash
emcc -o hello.js hello.c -O3
```

Sau đó bạn có thể kết hợp tệp JavaScript này vào chương trình của mình, điều này đặc biệt hữu ích nếu bạn đang sử dụng bundler và không làm việc trực tiếp với HTML. Ví dụ: bạn có thể nhập khẩu tệp JavaScript glue đã tạo để nó chạy như một hiệu ứng phụ. Trong mô-đun đầu vào của ứng dụng của bạn, thêm:

```js
import "./hello.js";
```

Ngoài ra, bạn có thể tạo một mô-đun factory, cho phép bạn tạo nhiều phiên bản của mô-đun (theo mặc định code glue tải mô-đun toàn cục, gây ra nhiều phiên bản va chạm nhau).

```bash
emcc -o hello.mjs hello.c -O3 -sMODULARIZE
```

> [!NOTE]
> Nếu phần mở rộng tệp đầu ra của bạn là .js chứ không phải .mjs, thì bạn phải thêm cài đặt `-sEXPORT_ES6` để xuất ra một mô-đun JavaScript.

Sau đó trong code của bạn hãy nhập khẩu factory và gọi nó:

```js
import createModule from "./hello.mjs";

createModule().then((Module) => {
  console.log("Wasm ready", Module);
});
```

## Gọi hàm tùy chỉnh được định nghĩa trong C

Nếu bạn muốn gọi một hàm được định nghĩa trong code C của mình từ JavaScript, bạn có thể sử dụng hàm `ccall()` của Emscripten và khai báo `EMSCRIPTEN_KEEPALIVE`, thêm các hàm của bạn vào danh sách hàm được xuất khẩu (xem [Tại sao các hàm trong mã nguồn C/C++ của tôi biến mất khi tôi biên dịch sang JavaScript, và/hoặc tôi nhận được No functions to process?](https://emscripten.org/docs/getting_started/FAQ.html#why-do-functions-in-my-c-c-source-code-vanish-when-i-compile-to-webassembly)). Hãy xem cách thức hoạt động của điều này.

1. Để bắt đầu, lưu code sau dưới dạng `hello3.c` trong một thư mục mới:

   ```c
   #include <stdio.h>
   #include <emscripten/emscripten.h>

   int main() {
       printf("Hello World\n");
       return 0;
   }

   #ifdef __cplusplus
   #define EXTERN extern "C"
   #else
   #define EXTERN
   #endif

   EXTERN EMSCRIPTEN_KEEPALIVE void myFunction(int argc, char ** argv) {
       printf("MyFunction Called\n");
   }
   ```

   Theo mặc định, code được tạo bởi Emscripten luôn chỉ gọi hàm `main()`, và các hàm khác bị loại bỏ như code chết. Đặt `EMSCRIPTEN_KEEPALIVE` trước tên hàm ngăn điều này xảy ra. Bạn cũng cần nhập khẩu thư viện `emscripten.h` để sử dụng `EMSCRIPTEN_KEEPALIVE`.

   > [!NOTE]
   > Chúng ta đang bao gồm các khối `#ifdef` để nếu bạn đang cố gắng bao gồm điều này trong code C++, ví dụ vẫn sẽ hoạt động. Do các quy tắc name mangling của C và C++, điều này sẽ bị hỏng nếu không có điều này, nhưng ở đây chúng ta đang đặt nó để coi đây là hàm C bên ngoài nếu bạn đang sử dụng C++.

2. Bây giờ thêm `html_template/shell_minimal.html` với `\{\{{ SCRIPT }}}` như nội dung vào thư mục mới này để thuận tiện (bạn rõ ràng sẽ đặt điều này ở một nơi trung tâm trong môi trường phát triển thực tế của bạn).
3. Bây giờ hãy chạy bước biên dịch lại. Từ bên trong thư mục mới nhất của bạn (và trong khi bên trong cửa sổ terminal môi trường trình biên dịch Emscripten), biên dịch code C của bạn với lệnh sau. Lưu ý rằng chúng ta cần biên dịch với `NO_EXIT_RUNTIME`: nếu không, khi `main()` thoát, thời gian chạy sẽ bị tắt và sẽ không hợp lệ khi gọi code đã biên dịch. Điều này là cần thiết để mô phỏng C đúng đắn: ví dụ, để đảm bảo các hàm [`atexit()`](https://en.cppreference.com/w/c/program/atexit) được gọi.

   ```bash
   emcc -o hello3.html hello3.c --shell-file html_template/shell_minimal.html -s NO_EXIT_RUNTIME=1 -s "EXPORTED_RUNTIME_METHODS=['ccall']"
   ```

4. Nếu bạn tải ví dụ trong trình duyệt một lần nữa, bạn sẽ thấy kết quả giống như trước!
5. Bây giờ chúng ta cần chạy hàm `myFunction()` mới của mình từ JavaScript. Trước tiên, hãy mở tệp hello3.html trong trình soạn thảo văn bản.
6. Thêm phần tử {{HTMLElement("button")}} như hiển thị bên dưới, ngay phía trên thẻ mở đầu tiên `<script type="text/javascript">`.

   ```html
   <button id="my-button">Run myFunction</button>
   ```

7. Bây giờ thêm code sau vào cuối phần tử {{HTMLElement("script")}} đầu tiên:

   ```js
   document.getElementById("my-button").addEventListener("click", () => {
     alert("check console");
     const result = Module.ccall(
       "myFunction", // name of C function
       null, // return type
       null, // argument types
       null, // arguments
     );
   });
   ```

Điều này minh họa cách `ccall()` được sử dụng để gọi hàm được xuất khẩu.

## Xem thêm

- [emscripten.org](https://emscripten.org/) — tìm hiểu thêm về Emscripten và nhiều tùy chọn của nó.
- [Gọi các hàm C đã biên dịch từ JavaScript bằng ccall/cwrap](https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code.html#calling-compiled-c-functions-from-javascript-using-ccall-cwrap)
- [Tại sao các hàm trong mã nguồn C/C++ của tôi biến mất khi tôi biên dịch sang JavaScript, và/hoặc tôi nhận được No functions to process?](https://emscripten.org/docs/getting_started/FAQ.html#why-do-functions-in-my-c-c-source-code-vanish-when-i-compile-to-javascript-and-or-i-get-no-functions-to-process)
- [Biên dịch mô-đun C hiện có sang WebAssembly](/en-US/docs/WebAssembly/Guides/Existing_C_to_Wasm)
