---
title: Biên dịch từ Rust sang WebAssembly
slug: WebAssembly/Guides/Rust_to_Wasm
page-type: guide
sidebar: webassemblysidebar
---

Hướng dẫn này chỉ cho bạn cách biên dịch một dự án Rust thành WebAssembly và sử dụng nó trong ứng dụng web hiện có.

## Trường hợp sử dụng Rust và WebAssembly

Có hai trường hợp sử dụng chính cho Rust và WebAssembly:

- Xây dựng toàn bộ ứng dụng — toàn bộ ứng dụng web dựa trên Rust.
- Xây dựng một phần của ứng dụng — sử dụng Rust trong frontend JavaScript hiện có.

Hiện tại, nhóm Rust đang tập trung vào trường hợp sau, và đó là những gì chúng ta đề cập ở đây. Đối với trường hợp trước, hãy xem các dự án như [`yew`](https://github.com/yewstack/yew) và [leptos](https://github.com/leptos-rs/leptos).

Trong hướng dẫn này, chúng ta xây dựng một gói bằng `wasm-pack`, một công cụ để xây dựng các gói JavaScript trong Rust. Gói này sẽ chỉ chứa code WebAssembly và JavaScript, vì vậy người dùng sẽ không cần cài đặt Rust. Họ thậm chí có thể không nhận ra rằng nó được viết bằng Rust.

## Thiết lập môi trường Rust

Chúng ta sẽ bắt đầu bằng cách thiết lập môi trường cần thiết.

### Cài đặt Rust

Cài đặt Rust bằng cách truy cập trang [Cài đặt Rust](https://rust-lang.org/tools/install/) và làm theo hướng dẫn. Điều này cài đặt một công cụ gọi là "rustup", cho phép bạn quản lý nhiều phiên bản Rust. Theo mặc định, nó cài đặt phiên bản Rust ổn định mới nhất, bạn có thể sử dụng cho phát triển Rust tổng quát. Rustup cài đặt `rustc`, trình biên dịch Rust, `cargo`, trình quản lý gói của Rust, `rust-std`, các thư viện chuẩn của Rust, và một số tài liệu hữu ích — `rust-docs`.

> [!NOTE]
> Hãy chú ý đến ghi chú sau khi cài đặt về việc cần thư mục `bin` của cargo trong `PATH` hệ thống của bạn. Điều này được thêm tự động, nhưng bạn phải khởi động lại terminal để có hiệu lực.

### wasm-pack

Để xây dựng gói, chúng ta cần một công cụ bổ sung, `wasm-pack`. Điều này giúp biên dịch code sang WebAssembly và tạo ra gói đúng để sử dụng trong trình duyệt. Để tải xuống và cài đặt nó, hãy nhập lệnh sau vào terminal của bạn:

```bash
cargo install wasm-pack
```

## Xây dựng gói WebAssembly của chúng ta

Đủ thiết lập rồi; hãy tạo một gói mới trong Rust. Điều hướng đến nơi bạn lưu các dự án của mình và gõ:

```bash
cargo new --lib hello-wasm
```

Điều này tạo ra một thư viện mới trong thư mục con có tên `hello-wasm` với mọi thứ bạn cần để bắt đầu:

```plain
├── Cargo.toml
└── src
    └── lib.rs
```

`Cargo.toml` là tệp cấu hình bản dựng của chúng ta. Nó hoạt động tương tự như `Gemfile` từ Bundler hoặc `package.json` từ npm.

Cargo cũng đã tạo ra một số code Rust cho chúng ta trong `src/lib.rs`:

```rust
pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
```

### Hãy viết một số code Rust

Chúng ta sẽ không sử dụng code `src/lib.rs` đã tạo được hiển thị ở trên; hãy thay thế nó bằng code sau:

```rust
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern "C" {
    pub fn alert(s: &str);
}

#[wasm_bindgen]
pub fn greet(name: &str) {
    alert(&format!("Hello, {}!", name));
}
```

Code Rust của chúng ta có ba phần chính; hãy nói về từng phần một. Chúng ta đưa ra giải thích cấp cao ở đây và bỏ qua một số chi tiết; để tìm hiểu thêm về Rust, hãy kiểm tra cuốn sách trực tuyến miễn phí [The Rust Programming Language](https://doc.rust-lang.org/book/).

#### Sử dụng `wasm-bindgen` để giao tiếp giữa Rust và JavaScript

Phần đầu tiên trông như thế này:

```rust
use wasm_bindgen::prelude::*;
```

Thư viện được gọi là "crate" trong Rust.

Hiểu không? _Cargo_ vận chuyển _crate_.

Dòng đầu tiên chứa một lệnh `use`, nhập khẩu code từ một thư viện vào code của bạn. Trong trường hợp này, chúng ta đang nhập khẩu mọi thứ trong mô-đun `wasm_bindgen::prelude`. Chúng ta sử dụng các tính năng này trong phần tiếp theo.

Trước khi chuyển sang phần tiếp theo, chúng ta nên nói thêm về `wasm-bindgen`.

`wasm-pack` sử dụng `wasm-bindgen`, một công cụ khác, để cung cấp cầu nối giữa các kiểu của JavaScript và Rust. Nó cho phép JavaScript gọi API Rust với chuỗi, hoặc một hàm Rust để bắt một ngoại lệ JavaScript.

Chúng ta sử dụng chức năng của `wasm-bindgen` trong gói của chúng ta. Thực tế, đó là phần tiếp theo.

#### Gọi các hàm bên ngoài trong JavaScript từ Rust

Phần tiếp theo trông như thế này:

```rust
#[wasm_bindgen]
extern "C" {
    pub fn alert(s: &str);
}
```

Bit bên trong `#[ ]` được gọi là "attribute" (thuộc tính), và nó sửa đổi câu lệnh tiếp theo theo một cách nào đó. Trong trường hợp này, câu lệnh đó là một `extern`, nói với Rust rằng chúng ta muốn gọi một số hàm được định nghĩa bên ngoài. Thuộc tính nói "wasm-bindgen biết cách tìm các hàm này".

Dòng thứ ba là chữ ký hàm, được viết bằng Rust. Nó nói "hàm `alert` nhận một đối số, một chuỗi có tên `s`."

Như bạn có thể đoán, đây là [hàm `alert` được cung cấp bởi JavaScript](/en-US/docs/Web/API/Window/alert). Chúng ta gọi hàm này trong phần tiếp theo.

Bất cứ khi nào bạn muốn gọi các hàm JavaScript, bạn có thể thêm chúng vào tệp này, và `wasm-bindgen` thiết lập mọi thứ cho bạn. Không phải mọi thứ đều được hỗ trợ, nhưng chúng ta đang làm việc với nó. Hãy [báo cáo lỗi](https://github.com/rustwasm/wasm-bindgen/issues/new) nếu có gì đó còn thiếu.

#### Tạo các hàm Rust mà JavaScript có thể gọi

Phần cuối cùng là cái này:

```rust
#[wasm_bindgen]
pub fn greet(name: &str) {
    alert(&format!("Hello, {}!", name));
}
```

Một lần nữa, chúng ta thấy thuộc tính `#[wasm_bindgen]`. Trong trường hợp này, nó không sửa đổi một khối `extern`, mà là một `fn`; điều này có nghĩa là chúng ta muốn hàm Rust này có thể được gọi bởi JavaScript. Đó là điều ngược lại với `extern`: đây không phải là các hàm chúng ta cần, mà là các hàm chúng ta cung cấp cho thế giới.

Hàm này được đặt tên là `greet`, và nhận một đối số, một chuỗi (được viết `&str`), `name`. Sau đó nó gọi hàm `alert` chúng ta đã yêu cầu trong khối `extern` ở trên. Nó truyền một lời gọi đến macro `format!`, cho phép chúng ta nối các chuỗi.

Macro `format!` nhận hai đối số trong trường hợp này: một chuỗi định dạng và một biến để đưa vào đó. Chuỗi định dạng là bit `"Hello, {}!"`. Nó chứa `{}`, nơi các biến sẽ được nội suy. Biến chúng ta đang truyền là `name`, đối số của hàm, vì vậy nếu chúng ta gọi `greet("Steve")` chúng ta sẽ thấy `"Hello, Steve!"`.

Điều này được truyền cho `alert()`, vì vậy khi chúng ta gọi hàm này chúng ta sẽ thấy hộp cảnh báo với "Hello, Steve!" trong đó.

Bây giờ thư viện của chúng ta đã được viết, hãy xây dựng nó.

### Biên dịch code của chúng ta sang WebAssembly

Để biên dịch code của chúng ta đúng cách, trước tiên chúng ta cấu hình nó với `Cargo.toml`. Mở tệp này và thay đổi nội dung của nó để trông như thế này:

```toml
[package]
name = "hello-wasm"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
description = "A sample project with wasm-pack"
license = "MIT/Apache-2.0"
repository = "https://github.com/yourgithubusername/hello-wasm"
edition = "2021"

[lib]
crate-type = ["cdylib"]

[dependencies]
wasm-bindgen = "0.2"
```

Điền vào repository của riêng bạn và sử dụng thông tin tương tự mà `git` sử dụng cho trường `authors`.

Phần lớn để thêm vào là `[package]`. Phần `[lib]` nói với Rust xây dựng phiên bản `cdylib` của gói của chúng ta; chúng ta sẽ không đi vào ý nghĩa của điều đó trong hướng dẫn này. Để biết thêm, hãy tham khảo tài liệu [Cargo](https://doc.rust-lang.org/cargo/guide/) và [Rust Linkage](https://doc.rust-lang.org/reference/linkage.html).

Phần cuối cùng là phần `[dependencies]`. Đây là nơi chúng ta nói với Cargo phiên bản nào của `wasm-bindgen` chúng ta muốn phụ thuộc vào; trong trường hợp này, đó là bất kỳ phiên bản `0.2.z` nào (nhưng không phải `0.3.0` hoặc cao hơn).

### Xây dựng gói

Bây giờ chúng ta đã hoàn thành thiết lập, hãy xây dựng gói.
Chúng ta sẽ sử dụng code đã tạo trong mô-đun ES native và Node.js.
Với mục đích này, chúng ta sẽ sử dụng [đối số `--target`](https://rustwasm.github.io/docs/wasm-pack/commands/build.html#target) trong `wasm-pack build` để chỉ định loại WebAssembly và JavaScript nào được tạo.

Đầu tiên, chạy lệnh sau bên trong thư mục `hello-wasm` của bạn:

```bash
wasm-pack build --target web
```

Điều này thực hiện một số điều. Để tìm hiểu chi tiết về chúng, hãy xem [bài đăng blog này trên Mozilla Hacks](https://hacks.mozilla.org/2018/04/hello-wasm-pack/). Tóm lại, `wasm-pack build`:

1. Biên dịch code Rust của bạn sang WebAssembly.
2. Chạy `wasm-bindgen` trên WebAssembly đó, tạo ra một tệp JavaScript bao bọc tệp WebAssembly đó thành một mô-đun mà trình duyệt có thể hiểu.
3. Tạo thư mục `pkg` và di chuyển tệp JavaScript đó và code WebAssembly của bạn vào trong đó.
4. Đọc `Cargo.toml` của bạn và tạo ra `package.json` tương đương.
5. Sao chép `README.md` của bạn (nếu bạn có) vào gói.

Kết quả cuối cùng? Bạn có một gói bên trong thư mục `pkg`.

## Sử dụng gói trên web

Bây giờ chúng ta đã có mô-đun Wasm đã biên dịch, hãy chạy nó trong trình duyệt.
Hãy bắt đầu bằng cách tạo một tệp có tên `index.html` ở gốc của dự án, vì vậy chúng ta sẽ có cấu trúc dự án sau:

```plain
├── Cargo.lock
├── Cargo.toml
├── index.html  <-- new index.html file
├── pkg
│   ├── hello_wasm.d.ts
│   ├── hello_wasm.js
│   ├── hello_wasm_bg.wasm
│   ├── hello_wasm_bg.wasm.d.ts
│   └── package.json
├── src
│   └── lib.rs
└── target
    ├── CACHEDIR.TAG
    ├── release
    └── wasm32-unknown-unknown
```

Đặt nội dung sau vào tệp `index.html`:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>hello-wasm example</title>
  </head>
  <body>
    <script type="module">
      import init, { greet } from "./pkg/hello_wasm.js";

      init().then(() => {
        greet("WebAssembly");
      });
    </script>
  </body>
</html>
```

Script trong tệp này sẽ nhập khẩu code JavaScript glue, khởi tạo mô-đun Wasm và gọi hàm `greet` chúng ta đã viết trong Rust.

Phục vụ gốc dự án với máy chủ web cục bộ (ví dụ: `python3 -m http.server`). Nếu bạn không chắc cách làm điều đó, hãy tham khảo [Chạy máy chủ HTTP cục bộ đơn giản](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server#running_a_simple_local_http_server).

> [!NOTE]
> Sử dụng máy chủ web cập nhật hỗ trợ loại MIME `application/wasm`. Các máy chủ web cũ hơn có thể chưa hỗ trợ nó.

Tải `index.html` từ máy chủ web (nếu bạn sử dụng ví dụ Python3: `http://localhost:8000`). Một hộp cảnh báo xuất hiện trên màn hình chứa `Hello, WebAssembly!`. Chúng ta đã gọi thành công từ JavaScript vào Rust và từ Rust vào JavaScript.

## Cung cấp gói của chúng ta cho npm

Chúng ta đang xây dựng một gói npm, vì vậy bạn cần có Node.js và npm đã được cài đặt.

Để lấy Node.js và npm, hãy truy cập trang [Get npm!](https://docs.npmjs.com/getting-started/) và làm theo hướng dẫn.
Hướng dẫn này nhắm đến node 20. Để chuyển đổi giữa các phiên bản node, bạn có thể sử dụng [nvm](https://github.com/nvm-sh/nvm).

Để sử dụng mô-đun WebAssembly với npm, chúng ta sẽ cần thực hiện một vài thay đổi.
Hãy bắt đầu bằng cách biên dịch lại Rust của chúng ta với tùy chọn `bundler` làm mục tiêu:

```bash
wasm-pack build --target bundler
```

Chúng ta bây giờ có một gói npm, được viết bằng Rust, nhưng được biên dịch sang WebAssembly. Nó sẵn sàng để sử dụng từ JavaScript và không yêu cầu người dùng cài đặt Rust; code được bao gồm là code WebAssembly, không phải nguồn Rust.

### Sử dụng gói npm trên web

Hãy xây dựng một trang web sử dụng gói npm mới của chúng ta. Nhiều người sử dụng các gói npm thông qua nhiều công cụ bundler khác nhau, và chúng ta sẽ sử dụng một trong số đó, `webpack`, trong hướng dẫn này. Nó chỉ phức tạp một chút và cho thấy một trường hợp sử dụng thực tế.

Hãy tạo một thư mục mới bên trong thư mục `hello-wasm` có tên `site` để thử.
Chúng ta chưa xuất bản gói lên registry npm, vì vậy chúng ta có thể cài đặt nó từ phiên bản cục bộ bằng `npm i /path/to/package`.
Bạn có thể sử dụng [`npm link`](https://docs.npmjs.com/cli/v10/commands/npm-link/), nhưng cài đặt từ đường dẫn cục bộ thuận tiện hơn cho bản demo này:

```bash
mkdir site && cd site
npm i ../pkg
```

Cài đặt các phụ thuộc phát triển `webpack`:

```bash
npm i -D webpack@5 webpack-cli@5 webpack-dev-server@5 copy-webpack-plugin@12
```

Tiếp theo, chúng ta cần cấu hình webpack. Tạo `webpack.config.js` và đặt nội dung sau vào đó:

```js
const CopyPlugin = require("copy-webpack-plugin");
const path = require("path");

module.exports = {
  entry: "./index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "index.js",
  },
  mode: "development",
  experiments: {
    asyncWebAssembly: true,
  },
  plugins: [
    new CopyPlugin({
      patterns: [{ from: "index.html" }],
    }),
  ],
};
```

Trong `package.json` của bạn, bạn có thể thêm các script `build` và `serve` sẽ chạy webpack với tệp cấu hình chúng ta vừa tạo:

```json
{
  "scripts": {
    "build": "webpack --config webpack.config.js",
    "serve": "webpack serve --config webpack.config.js --open"
  },
  "dependencies": {
    "hello-wasm": "file:../pkg"
  },
  "devDependencies": {
    "copy-webpack-plugin": "^12.0.2",
    "webpack": "^5.97.1",
    "webpack-cli": "^5.1.4",
    "webpack-dev-server": "^5.1.0"
  }
}
```

Tiếp theo, tạo một tệp có tên `index.js` và cung cấp cho nó những nội dung này:

```js
import * as wasm from "hello-wasm";

wasm.greet("WebAssembly with npm");
```

Điều này nhập khẩu mô-đun từ thư mục `node_modules` và gọi hàm `greet`, truyền `"WebAssembly with npm"` như là một chuỗi. Lưu ý cách không có gì đặc biệt ở đây, nhưng chúng ta đang gọi vào code Rust. Đối với code JavaScript, đây chỉ là một mô-đun bình thường.

Cuối cùng, chúng ta cần thêm một tệp HTML để tải JavaScript. Tạo tệp `index.html` và thêm nội dung sau:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>hello-wasm example</title>
  </head>
  <body>
    <script src="./index.js"></script>
  </body>
</html>
```

Thư mục `hello-wasm/site` sẽ trông như thế này:

```plain
├── node_modules
├── index.html
├── index.js
├── package-lock.json
├── package.json
└── webpack.config.js
```

Chúng ta đã xong làm tệp. Hãy thử:

```bash
npm run serve
```

Điều này khởi động một máy chủ web và mở `http://localhost:8080`. Bạn sẽ thấy một hộp cảnh báo trên màn hình chứa văn bản `Hello, WebAssembly with npm!`. Chúng ta đã sử dụng thành công mô-đun Rust với npm!

Nếu bạn muốn sử dụng WebAssembly bên ngoài phát triển cục bộ, bạn có thể xuất bản gói bằng các lệnh `pack` và `publish` bên trong thư mục `hello-wasm` của bạn:

```bash
wasm-pack pack
npm notice
npm notice 📦  hello-wasm@0.1.0
npm notice Tarball Contents
npm notice 2.9kB hello_wasm_bg.js
npm notice 16.7kB hello_wasm_bg.wasm
npm notice 85B hello_wasm.d.ts
npm notice 182B hello_wasm.js
npm notice 549B package.json
...
hello-wasm-0.1.0.tgz
[INFO]: 🎒  packed up your package!
```

Để xuất bản lên npm, bạn sẽ cần một [tài khoản npm](https://www.npmjs.com/) và ủy quyền máy của mình bằng [`npm adduser`](https://docs.npmjs.com/cli/v10/commands/npm-adduser/).
Khi bạn đã sẵn sàng, bạn có thể xuất bản bằng `wasm-pack` gọi `npm publish` ở phía dưới:

```bash
wasm-pack publish
```

## Kết luận

Đây là phần kết thúc hướng dẫn của chúng ta; chúng ta hy vọng bạn thấy nó hữu ích.

Có rất nhiều công việc thú vị đang diễn ra trong không gian này; nếu bạn muốn giúp làm cho nó tốt hơn, hãy xem [Rust and WebAssembly Working Group](https://github.com/rustwasm/team/blob/master/README.md#get-involved).
