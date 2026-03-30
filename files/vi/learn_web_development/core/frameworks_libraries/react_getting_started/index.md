---
title: Bắt đầu với React
short-title: React bắt đầu
slug: Learn_web_development/Core/Frameworks_libraries/React_getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Main_features","Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết này, chúng ta sẽ chào đón React. Chúng ta sẽ khám phá một chút chi tiết về lịch sử và các trường hợp sử dụng của nó, thiết lập một chuỗi công cụ React cơ bản trên máy tính cục bộ, và tạo và thử nghiệm với một ứng dụng khởi động đơn giản — học một chút về cách React hoạt động trong quá trình đó.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, và <a href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line">dòng lệnh/terminal</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
          Thiết lập môi trường phát triển React cục bộ, tạo ứng dụng khởi động và
          hiểu những kiến thức cơ bản về cách nó hoạt động.
      </td>
    </tr>
  </tbody>
</table>

## Xin chào React

Như tiêu đề chính thức của nó, [React](https://react.dev/) là một thư viện để xây dựng giao diện người dùng. React không phải là framework — thậm chí nó không độc quyền cho web. Nó được sử dụng cùng với các thư viện khác để kết xuất đến các môi trường nhất định. Ví dụ, [React Native](https://reactnative.dev/) có thể được sử dụng để xây dựng ứng dụng di động.

Để xây dựng cho web, các nhà phát triển sử dụng React kết hợp với [ReactDOM](https://react.dev/reference/react-dom). React và ReactDOM thường được thảo luận trong cùng không gian và được sử dụng để giải quyết các vấn đề tương tự như các framework phát triển web thực sự khác. Khi chúng ta gọi React là "framework", chúng ta đang làm việc với sự hiểu biết thông thường đó.

Mục tiêu chính của React là giảm thiểu các lỗi xảy ra khi các nhà phát triển xây dựng giao diện người dùng. Nó thực hiện điều này thông qua việc sử dụng các thành phần — các đoạn code tự chứa, logic mô tả một phần của giao diện người dùng. Các thành phần này có thể được kết hợp với nhau để tạo ra một giao diện người dùng đầy đủ, và React trừu tượng hóa phần lớn công việc kết xuất, để bạn tập trung vào thiết kế giao diện người dùng.

## Các trường hợp sử dụng

Không giống như các framework khác được đề cập trong module này, React không áp đặt các quy tắc nghiêm ngặt về quy ước code hoặc tổ chức tệp. Điều này cho phép các nhóm thiết lập các quy ước phù hợp nhất với họ, và áp dụng React theo bất kỳ cách nào họ muốn. React có thể xử lý một nút đơn lẻ, một vài phần của giao diện, hoặc toàn bộ giao diện người dùng của ứng dụng.

Mặc dù React _có thể_ được sử dụng cho [các phần nhỏ của giao diện](https://react.dev/learn/add-react-to-an-existing-project), nhưng không dễ "thả vào" một ứng dụng như thư viện jQuery, hay thậm chí một framework như Vue — nó dễ tiếp cận hơn khi bạn xây dựng toàn bộ ứng dụng với React.

Ngoài ra, nhiều lợi ích trải nghiệm nhà phát triển của ứng dụng React, chẳng hạn như viết giao diện với JSX, yêu cầu quá trình biên dịch. Thêm trình biên dịch như Babel vào một trang web làm cho code chạy chậm hơn, vì vậy các nhà phát triển thường thiết lập công cụ như vậy với một bước build. React có lẽ có yêu cầu công cụ nặng, nhưng nó có thể được học.

Bài viết này sẽ tập trung vào trường hợp sử dụng React để kết xuất toàn bộ giao diện người dùng của ứng dụng với sự hỗ trợ của [Vite](https://vite.dev/), một công cụ build front-end hiện đại.

## React sử dụng JavaScript như thế nào?

React sử dụng các tính năng của JavaScript hiện đại cho nhiều mẫu của nó. Sự khác biệt lớn nhất so với JavaScript xuất phát từ việc sử dụng cú pháp [JSX](https://react.dev/learn/writing-markup-with-jsx). JSX mở rộng cú pháp JavaScript để code giống HTML có thể nằm bên cạnh nó. Ví dụ:

```jsx
const heading = <h1>Mozilla Developer Network</h1>;
```

Hằng số heading này được gọi là **biểu thức JSX**. React có thể sử dụng nó để kết xuất thẻ [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) đó trong ứng dụng của chúng ta.

Giả sử chúng ta muốn bọc heading vào một thẻ [`<header>`](/en-US/docs/Web/HTML/Reference/Elements/header), vì lý do ngữ nghĩa? Cách tiếp cận JSX cho phép chúng ta lồng các phần tử bên trong nhau, giống như chúng ta làm với HTML:

```jsx
const header = (
  <header>
    <h1>Mozilla Developer Network</h1>
  </header>
);
```

> [!NOTE]
> Dấu ngoặc đơn trong đoạn code trước không độc đáo với JSX, và không có bất kỳ hiệu ứng nào đối với ứng dụng của bạn. Chúng là tín hiệu cho bạn (và máy tính của bạn) rằng nhiều dòng code bên trong là một phần của cùng một biểu thức. Bạn cũng có thể viết biểu thức header như thế này:
>
> ```jsx-nolint
> const header = <header>
>   <h1>Mozilla Developer Network</h1>
> </header>;
> ```
>
> Tuy nhiên, điều này trông có vẻ hơi lạ, vì thẻ [`<header>`](/en-US/docs/Web/HTML/Reference/Elements/header) bắt đầu biểu thức không được thụt lề ở cùng vị trí với thẻ đóng tương ứng.

Tất nhiên, trình duyệt của bạn không thể đọc JSX mà không có sự trợ giúp. Khi được biên dịch (sử dụng công cụ như [Babel](https://babeljs.io/) hoặc [Parcel](https://parceljs.org/)), biểu thức header của chúng ta sẽ trông như thế này:

```jsx
const header = React.createElement(
  "header",
  null,
  React.createElement("h1", null, "Mozilla Developer Network"),
);
```

_Có thể_ bỏ qua bước biên dịch và sử dụng [`React.createElement()`](https://react.dev/reference/react/createElement) để tự viết giao diện người dùng. Tuy nhiên, khi làm vậy, bạn mất đi lợi ích khai báo của JSX, và code của bạn trở nên khó đọc hơn. Biên dịch là một bước thêm trong quá trình phát triển, nhưng nhiều nhà phát triển trong cộng đồng React cho rằng khả năng đọc của JSX là xứng đáng. Ngoài ra, phát triển front-end hiện đại hầu như luôn liên quan đến quá trình build — bạn phải hạ cấp cú pháp hiện đại để tương thích với các trình duyệt cũ hơn, và bạn có thể muốn [rút gọn](/en-US/docs/Glossary/Minification) code để tối ưu hóa hiệu suất tải. Công cụ phổ biến như Babel đã đi kèm hỗ trợ JSX sẵn, vì vậy bạn không phải tự cấu hình biên dịch trừ khi bạn muốn.

Vì JSX là sự kết hợp của HTML và JavaScript, một số nhà phát triển thấy nó trực quan. Những người khác nói rằng bản chất kết hợp của nó làm cho nó khó hiểu. Tuy nhiên, khi bạn đã quen với nó, nó sẽ cho phép bạn xây dựng giao diện người dùng nhanh hơn và trực quan hơn, và cho phép người khác hiểu cơ sở code của bạn tốt hơn khi nhìn qua.

Để đọc thêm về JSX, hãy xem bài viết [Viết Đánh dấu với JSX](https://react.dev/learn/writing-markup-with-jsx) của nhóm React.

## Thiết lập ứng dụng React đầu tiên của bạn

Có nhiều cách để tạo ứng dụng React mới. Chúng ta sẽ sử dụng Vite để tạo ứng dụng mới qua dòng lệnh.

Có thể [thêm React vào dự án hiện có](https://react.dev/learn/add-react-to-an-existing-project) bằng cách sao chép một số phần tử [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) vào tệp HTML, nhưng sử dụng Vite sẽ cho phép bạn dành nhiều thời gian hơn để xây dựng ứng dụng và ít thời gian hơn để lo lắng về thiết lập.

> [!NOTE]
> Bạn có thể bắt đầu viết code React mà không cần thực hiện _bất kỳ_ thiết lập cục bộ nào bằng cách làm theo scrim [First React Code](https://scrimba.com/learn-react-c0e/~03uo?via=mdn) của Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>.
> Hãy thử dùng nó trước khi tiếp tục.

### Yêu cầu

Để sử dụng Vite, bạn cần cài đặt [Node.js](https://nodejs.org/en/). Kể từ Vite 5.0, cần ít nhất Node phiên bản 18 trở lên, và tốt nhất là chạy phiên bản hỗ trợ dài hạn (LTS) mới nhất khi có thể. Kể từ ngày 24 tháng 10 năm 2023, Node 20 là phiên bản LTS mới nhất. Node bao gồm npm (trình quản lý gói Node).

Để kiểm tra phiên bản Node của bạn, hãy chạy lệnh sau trong terminal:

```bash
node -v
```

Nếu Node được cài đặt, bạn sẽ thấy số phiên bản. Nếu không, bạn sẽ thấy thông báo lỗi. Để cài đặt Node, hãy làm theo hướng dẫn trên [trang web Node.js](https://nodejs.org/en/).

Bạn có thể sử dụng trình quản lý gói Yarn thay thế cho npm nhưng chúng ta sẽ giả sử bạn đang sử dụng npm trong bộ hướng dẫn này. Xem [Kiến thức cơ bản về quản lý gói](/en-US/docs/Learn_web_development/Extensions/Client-side_tools/Package_management) để biết thêm thông tin về npm và yarn.

Nếu bạn đang sử dụng Windows, bạn sẽ cần cài đặt một số phần mềm để cung cấp tương đương với terminal Unix/macOS để sử dụng các lệnh terminal được đề cập trong hướng dẫn này. **Git Bash** (đi kèm với [bộ công cụ git dành cho Windows](https://gitforwindows.org/)) hoặc **[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about)** (**WSL**) đều phù hợp. Xem [Khóa học cấp tốc dòng lệnh](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line) để biết thêm thông tin về những điều này và về các lệnh terminal nói chung.

Cũng cần lưu ý rằng React và ReactDOM tạo ra các ứng dụng chỉ hoạt động trên một bộ trình duyệt khá hiện đại như Firefox, Microsoft Edge, Safari hoặc Chrome khi làm việc qua các hướng dẫn này.

Xem phần sau để biết thêm thông tin:

- ["About npm" trên blog npm](https://docs.npmjs.com/about-npm/)
- ["Introducing npx" trên blog npm](https://blog.npmjs.org/post/162869356040/introducing-npx-an-npm-package-runner)
- [Tài liệu Vite](https://vite.dev/guide/)

### Khởi tạo ứng dụng của bạn

Trình quản lý gói npm đi kèm với lệnh `create` cho phép bạn tạo dự án mới từ các mẫu. Chúng ta có thể sử dụng nó để tạo ứng dụng mới từ mẫu React tiêu chuẩn của Vite. Hãy chắc chắn rằng bạn `cd` đến nơi bạn muốn ứng dụng của mình tồn tại trên máy, sau đó chạy lệnh sau trong terminal:

```bash
npm create vite@latest moz-todo-react -- --template react
```

Điều này tạo ra thư mục `moz-todo-react` bằng mẫu `react` của Vite.

> [!NOTE]
> `--` là cần thiết để truyền đối số cho các lệnh npm như `create`, và đối số `--template react` cho Vite biết sử dụng mẫu React của nó.

Terminal của bạn sẽ in một số thông báo nếu lệnh này thành công. Bạn nên thấy văn bản nhắc bạn `cd` vào thư mục mới của mình, cài đặt các phụ thuộc của ứng dụng và chạy ứng dụng cục bộ. Hãy bắt đầu với hai trong số những lệnh đó. Chạy lệnh sau trong terminal:

```bash
cd moz-todo-react && npm install
```

Sau khi quá trình hoàn tất, chúng ta cần khởi động một máy chủ phát triển cục bộ để chạy ứng dụng. Ở đây, chúng ta sẽ thêm một số cờ dòng lệnh vào đề xuất mặc định của Vite để mở ứng dụng trong trình duyệt ngay khi máy chủ bắt đầu, và sử dụng cổng 3000.

Chạy lệnh sau trong terminal:

```bash
npm run dev -- --open --port 3000
```

Khi máy chủ khởi động, bạn sẽ thấy tab trình duyệt mới chứa ứng dụng React của bạn:

![Screenshot of Firefox macOS open to localhost:3000, showing an application made from Vite's React template](default-vite.png)

### Cấu trúc ứng dụng

Vite cung cấp cho chúng ta mọi thứ cần thiết để phát triển ứng dụng React. Cấu trúc tệp ban đầu của nó trông như thế này:

```plain
moz-todo-react
├── README.md
├── index.html
├── node_modules
├── package-lock.json
├── package.json
├── public
│   └── vite.svg
├── src
│   ├── App.css
│   ├── App.jsx
│   ├── assets
│   │   └── react.svg
│   ├── index.css
│   └── main.jsx
└── vite.config.js
```

**`index.html`** là tệp cấp cao nhất quan trọng nhất. Vite chèn code của bạn vào tệp này để trình duyệt có thể chạy nó. Bạn sẽ không cần chỉnh sửa tệp này trong hướng dẫn của chúng ta, nhưng bạn nên thay đổi văn bản bên trong phần tử [`<title>`](/en-US/docs/Web/HTML/Reference/Elements/title) trong tệp này để phản ánh tiêu đề ứng dụng của bạn. Tiêu đề trang chính xác quan trọng cho khả năng tiếp cận.

Thư mục **`public`** chứa các tệp tĩnh sẽ được phục vụ trực tiếp cho trình duyệt mà không được xử lý bởi công cụ build của Vite. Hiện tại, nó chỉ chứa logo Vite.

Thư mục **`src`** là nơi chúng ta sẽ dành phần lớn thời gian, vì đó là nơi source code của ứng dụng tồn tại. Bạn sẽ nhận thấy rằng một số tệp JavaScript trong thư mục này kết thúc bằng phần mở rộng `.jsx`. Phần mở rộng này là cần thiết cho bất kỳ tệp nào chứa JSX — nó cho Vite biết cách chuyển đổi cú pháp JSX thành JavaScript mà trình duyệt của bạn có thể hiểu. Thư mục `src/assets` chứa logo React mà bạn đã thấy trong trình duyệt.

Các tệp `package.json` và `package-lock.json` chứa siêu dữ liệu về dự án của chúng ta. Các tệp này không dành riêng cho ứng dụng React: Vite đã điền `package.json` cho chúng ta, và npm đã tạo `package-lock.json` khi chúng ta cài đặt các phụ thuộc của ứng dụng. Bạn không cần hiểu những tệp này chút nào để hoàn thành hướng dẫn này. Tuy nhiên, nếu bạn muốn tìm hiểu thêm về chúng, bạn có thể đọc về [`package.json`](https://docs.npmjs.com/cli/v9/configuring-npm/package-json/) và [`package-lock.json`](https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json/) trong tài liệu npm. Chúng ta cũng nói về `package.json` trong hướng dẫn [Kiến thức cơ bản về quản lý gói](/en-US/docs/Learn_web_development/Extensions/Client-side_tools/Package_management) của chúng ta.

### Tùy chỉnh script dev của chúng ta

Trước khi tiến lên, bạn có thể muốn thay đổi tệp `package.json` của mình một chút để không phải truyền cờ `--open` và `--port` mỗi lần bạn chạy `npm run dev`. Mở `package.json` trong trình soạn thảo văn bản và tìm đối tượng `scripts`. Thay đổi khóa `"dev"` để nó trông như thế này:

```diff
- "dev": "vite",
+ "dev": "vite --open --port 3000",
```

Với điều này, ứng dụng của bạn sẽ mở trong trình duyệt tại `http://localhost:3000` mỗi khi bạn chạy `npm run dev`.

> [!NOTE]
> Bạn _không_ cần `--` thêm ở đây vì chúng ta đang truyền đối số trực tiếp cho `vite`, chứ không phải cho một npm script đã được định nghĩa trước.

## Khám phá thành phần React đầu tiên của chúng ta — `<App />`

Trong React, một **thành phần** là một mô-đun có thể tái sử dụng kết xuất một phần ứng dụng tổng thể của chúng ta. Các thành phần có thể lớn hoặc nhỏ, nhưng chúng thường được định nghĩa rõ ràng: chúng phục vụ một mục đích đơn lẻ, rõ ràng.

Hãy mở `src/App.jsx`, vì trình duyệt của chúng ta đang nhắc chúng ta chỉnh sửa nó. Tệp này chứa thành phần đầu tiên của chúng ta, `<App />`:

```jsx
import { useState } from "react";
import viteLogo from "/vite.svg";
import reactLogo from "./assets/react.svg";
import "./App.css";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  );
}

export default App;
```

Tệp `App.jsx` bao gồm ba phần chính: một số câu lệnh [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) ở trên, hàm `App()` ở giữa, và câu lệnh [`export`](/en-US/docs/Web/JavaScript/Reference/Statements/export) ở dưới cùng. Hầu hết các thành phần React đều tuân theo mẫu này.

### Câu lệnh import

Các câu lệnh `import` ở đầu tệp cho phép `App.jsx` sử dụng code đã được định nghĩa ở nơi khác. Hãy xem xét các câu lệnh này kỹ hơn.

```jsx
import { useState } from "react";
import viteLogo from "/vite.svg";
import reactLogo from "./assets/react.svg";
import "./App.css";
```

Câu lệnh đầu tiên nhập hook `useState` từ thư viện `react`. Hooks là cách sử dụng các tính năng của React bên trong một thành phần. Chúng ta sẽ nói thêm về hooks sau trong hướng dẫn này.

Sau đó, chúng ta nhập `reactLogo` và `viteLogo`. Lưu ý rằng đường dẫn nhập của chúng bắt đầu bằng `./` và `/` tương ứng và kết thúc bằng phần mở rộng `.svg` ở cuối. Điều này cho chúng ta biết rằng những lần nhập này là _cục bộ_, tham chiếu đến các tệp của riêng chúng ta chứ không phải gói npm.

Câu lệnh cuối cùng nhập CSS liên quan đến thành phần `<App />` của chúng ta. Lưu ý rằng không có tên biến và không có chỉ thị `from`. Đây được gọi là [_nhập hiệu ứng phụ_](/en-US/docs/Web/JavaScript/Reference/Statements/import#import_a_module_for_its_side_effects_only) — nó không nhập bất kỳ giá trị nào vào tệp JavaScript, nhưng nó cho Vite biết để thêm tệp CSS được tham chiếu vào đầu ra code cuối cùng, để nó có thể được sử dụng trong trình duyệt.

### Hàm `App()`

Sau các lần nhập, chúng ta có một hàm có tên `App()`, định nghĩa cấu trúc của thành phần `App`. Trong khi hầu hết cộng đồng JavaScript ưa thích tên {{Glossary("camel_case", "camel case thường")}} như `helloWorld`, các thành phần React sử dụng tên biến Pascal case (hoặc camel case hoa), như `HelloWorld`, để làm rõ rằng một phần tử JSX nhất định là thành phần React chứ không phải thẻ HTML thông thường. Nếu bạn đổi tên hàm `App()` thành `app()`, trình duyệt sẽ phát sinh lỗi.

Hãy xem xét `App()` kỹ hơn.

```jsx
function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  );
}
```

Hàm `App()` trả về một biểu thức JSX. Biểu thức này định nghĩa những gì trình duyệt của bạn cuối cùng kết xuất vào DOM.

Ngay dưới từ khóa `return` là một đoạn cú pháp đặc biệt: `<>`. Đây là một [fragment](https://react.dev/reference/react/Fragment). Các thành phần React phải trả về một phần tử JSX duy nhất, và fragment cho phép chúng ta làm điều đó mà không cần kết xuất các `<div>` tùy ý trong trình duyệt. Bạn sẽ thấy fragment trong nhiều ứng dụng React.

### Câu lệnh `export`

Có thêm một dòng code sau hàm `App()`:

```jsx
export default App;
```

Câu lệnh export này làm cho hàm `App()` của chúng ta có sẵn cho các mô-đun khác. Chúng ta sẽ nói thêm về điều này sau.

## Chuyển sang `main`

Hãy mở `src/main.jsx`, vì đó là nơi thành phần `<App />` đang được sử dụng. Tệp này là điểm vào cho ứng dụng của chúng ta, và ban đầu trông như thế này:

```jsx
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App.jsx";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
```

Giống như với `App.jsx`, tệp bắt đầu bằng cách nhập tất cả các mô-đun JavaScript và các tài nguyên khác cần thiết để chạy.

Hai câu lệnh đầu tiên nhập `StrictMode` và `createRoot` từ các thư viện `react` và `react-dom` vì chúng được tham chiếu sau trong tệp. Chúng ta không viết đường dẫn hay phần mở rộng khi nhập những thư viện này vì chúng không phải là tệp cục bộ. Thực tế, chúng được liệt kê là phụ thuộc trong tệp `package.json` của chúng ta. Hãy cẩn thận về sự phân biệt này khi bạn làm việc qua bài học này!

Sau đó, chúng ta nhập hàm `App()` và `index.css`, chứa các kiểu toàn cầu được áp dụng cho toàn bộ ứng dụng.

Sau đó, chúng ta gọi hàm `createRoot()`, định nghĩa nút gốc của ứng dụng. Hàm này nhận là đối số phần tử DOM mà chúng ta muốn ứng dụng React được kết xuất bên trong. Trong trường hợp này, đó là phần tử DOM có ID là `root`. Cuối cùng, chúng ta liên kết phương thức `render()` vào lời gọi `createRoot()`, truyền cho nó biểu thức JSX mà chúng ta muốn kết xuất bên trong nút gốc. Bằng cách viết `<App />` như biểu thức JSX này, chúng ta đang yêu cầu React gọi hàm `App()`, kết xuất _thành phần_ `App` bên trong nút gốc.

> [!NOTE]
> `<App />` được kết xuất bên trong một thành phần `<React.StrictMode>` đặc biệt. Thành phần này giúp các nhà phát triển phát hiện các vấn đề tiềm ẩn trong code của họ.

Bạn có thể đọc về các React API này, nếu muốn:

- [`ReactDOM.createRoot()`](https://react.dev/reference/react-dom/client/createRoot)
- [`React.StrictMode`](https://react.dev/reference/react/StrictMode)

## Bắt đầu mới

Trước khi bắt đầu xây dựng ứng dụng, chúng ta sẽ xóa một số code boilerplate mà Vite đã cung cấp cho chúng ta.

Đầu tiên, như một thử nghiệm, hãy thay đổi phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) trong `App.jsx` để nó đọc "Hello, World!", sau đó lưu tệp. Bạn sẽ nhận thấy rằng thay đổi này ngay lập tức được kết xuất trong máy chủ phát triển đang chạy tại `http://localhost:3000` trong trình duyệt của bạn. Hãy nhớ điều này khi bạn làm việc trên ứng dụng.

Chúng ta sẽ không sử dụng phần còn lại của code! Thay thế nội dung của `App.jsx` bằng phần sau:

```jsx
import "./App.css";

function App() {
  return (
    <>
      <header>
        <h1>Hello, World!</h1>
      </header>
    </>
  );
}

export default App;
```

## Thực hành với JSX

Tiếp theo, chúng ta sẽ sử dụng các kỹ năng JavaScript của mình để cảm thấy thoải mái hơn một chút khi viết JSX và làm việc với dữ liệu trong React. Chúng ta sẽ nói về cách thêm thuộc tính vào các phần tử JSX, cách viết nhận xét, cách kết xuất nội dung từ biến và các biểu thức khác, và cách truyền dữ liệu vào các thành phần với props.

### Thêm thuộc tính vào các phần tử JSX

Các phần tử JSX có thể có thuộc tính, giống như các phần tử HTML. Thử thêm `<button>` bên dưới phần tử `<h1>` trong tệp `App.jsx`, như thế này:

```jsx
<button type="button">Click me!</button>
```

Khi bạn lưu tệp, bạn sẽ thấy một nút với chữ `Click me!`. Nút chưa làm gì, nhưng chúng ta sẽ tìm hiểu về việc thêm tính tương tác vào ứng dụng sớm thôi.

Một số thuộc tính khác so với các đối tác HTML của chúng. Ví dụ, thuộc tính `class` trong HTML được dịch sang `className` trong JSX. Điều này là vì `class` là một từ dành riêng trong JavaScript, và JSX là một phần mở rộng JavaScript. Nếu bạn muốn thêm một lớp `primary` vào nút của mình, bạn sẽ viết nó như thế này:

```jsx
<button type="button" className="primary">
  Click me!
</button>
```

### Biểu thức JavaScript như nội dung

Không giống HTML, JSX cho phép chúng ta viết biến và các biểu thức JavaScript khác ngay bên cạnh nội dung khác. Hãy khai báo một biến gọi là `subject` ngay phía trên hàm `App()` trong tệp `App.jsx`:

```jsx
const subject = "React";
function App() {
  // code omitted for brevity
}
```

Tiếp theo, thay thế chữ "World" trong phần tử `<h1>` bằng `{subject}`:

```jsx
<h1>Hello, {subject}!</h1>
```

Lưu tệp và kiểm tra trình duyệt. Bạn sẽ thấy "Hello, React!" được kết xuất.

Dấu ngoặc nhọn xung quanh `subject` là một tính năng khác của cú pháp JSX. Dấu ngoặc nhọn cho React biết rằng chúng ta muốn đọc giá trị của biến `subject`, chứ không phải kết xuất chuỗi ký tự `"subject"`. Bạn có thể đặt bất kỳ biểu thức JavaScript hợp lệ nào bên trong dấu ngoặc nhọn trong JSX; React sẽ đánh giá nó và kết xuất _kết quả_ của biểu thức như nội dung cuối cùng. Sau đây là một loạt ví dụ, với nhận xét ở trên giải thích những gì mỗi biểu thức sẽ kết xuất:

```jsx-nolint
{/* Hello, React :)! */}
<h1>Hello, {`${subject} :)`}!</h1>
{/* Hello, REACT */}
<h1>Hello, {subject.toUpperCase()}</h1>
{/* Hello, 4! */}
<h1>Hello, {2 + 2}!</h1>
```

Thậm chí các nhận xét trong JSX được viết bên trong dấu ngoặc nhọn! Điều này là vì dấu ngoặc nhọn có thể chứa một biểu thức JavaScript đơn, và các nhận xét hợp lệ như một phần của biểu thức JavaScript (và bị bỏ qua). Bạn có thể sử dụng cả `/* cú pháp nhận xét khối */` và `// cú pháp nhận xét dòng` (với dòng mới ở cuối) bên trong dấu ngoặc nhọn.

### Props của thành phần

**Props** là phương tiện truyền dữ liệu vào thành phần React. Cú pháp của chúng giống hệt như của thuộc tính, thực ra: `prop="value"`. Sự khác biệt là trong khi thuộc tính được truyền vào các phần tử thông thường, props được truyền vào các thành phần React.

Trong React, luồng dữ liệu là một chiều: props chỉ có thể được truyền từ các thành phần cha xuống các thành phần con.

Hãy mở `main.jsx` và cho thành phần `<App />` prop đầu tiên của nó.

Thêm prop `subject` vào lời gọi thành phần `<App />`, với giá trị là `Clarice`. Khi bạn hoàn thành, nó trông như thế này:

```jsx
<App subject="Clarice" />
```

Quay lại `App.jsx`, hãy xem lại hàm `App()`. Thay đổi chữ ký của `App()` để nó chấp nhận `props` như một tham số và log `props` vào console để bạn có thể kiểm tra nó. Cũng xóa hằng số `subject`; chúng ta không cần nó nữa. Tệp `App.jsx` của bạn trông như thế này:

```jsx
function App(props) {
  console.log(props);
  return (
    <>
      {
        // code omitted for brevity
      }
    </>
  );
}
```

Lưu tệp và kiểm tra trình duyệt. Bạn sẽ thấy nền trống không có nội dung. Điều này là vì chúng ta đang cố đọc biến `subject` không còn được định nghĩa. Sửa điều này bằng cách nhận xét dòng `<h1>Hello {subject}!</h1>`.

> [!NOTE]
> Nếu trình soạn thảo của bạn hiểu cách phân tích JSX (hầu hết các trình soạn thảo hiện đại đều làm vậy!), bạn có thể sử dụng phím tắt nhận xét tích hợp sẵn của nó — `Ctrl + /` (trên Windows) hoặc `Cmd + /` (trên macOS) — để tạo nhận xét nhanh hơn.

Lưu tệp với dòng đó được nhận xét. Lần này, bạn sẽ thấy nút "Click me!" được kết xuất một mình. Nếu bạn mở console dành cho nhà phát triển của trình duyệt, bạn sẽ thấy một thông báo trông như thế này:

```plain
Object { subject: "Clarice" }
```

Thuộc tính đối tượng `subject` tương ứng với prop `subject` chúng ta đã thêm vào lời gọi thành phần `<App />`, và chuỗi `Clarice` tương ứng với giá trị của nó. Props của thành phần trong React luôn được thu thập thành các đối tượng theo cách này.

Hãy sử dụng prop `subject` này để sửa lỗi trong ứng dụng. Bỏ nhận xét dòng `<h1>Hello, {subject}!</h1>` và thay đổi thành `<h1>Hello, {props.subject}!</h1>`, sau đó xóa câu lệnh `console.log()`. Code của bạn trông như thế này:

```jsx
function App(props) {
  return (
    <>
      <header>
        <h1>Hello, {props.subject}!</h1>
        <button type="button" className="primary">
          Click me!
        </button>
      </header>
    </>
  );
}
```

Khi bạn lưu, ứng dụng bây giờ sẽ chào đón bạn với "Hello, Clarice!". Nếu bạn quay lại `main.jsx`, chỉnh sửa giá trị của `subject` và lưu, văn bản sẽ thay đổi.

Để thực hành thêm, bạn có thể thử thêm prop `greeting` bổ sung vào lời gọi thành phần `<App />` bên trong `main.jsx` và sử dụng nó cùng với prop `subject` bên trong `App.jsx`.

## Tóm tắt

Điều này đưa chúng ta đến cuối cái nhìn ban đầu về React, bao gồm cách cài đặt cục bộ, tạo ứng dụng khởi động và cách hoạt động cơ bản. Trong bài viết tiếp theo, chúng ta sẽ bắt đầu xây dựng ứng dụng đầu tiên thực sự — một danh sách việc cần làm. Trước khi làm điều đó, hãy tóm tắt một số điều chúng ta đã học.

Trong React:

- Các thành phần có thể nhập các mô-đun họ cần và phải tự xuất ở cuối tệp.
- Các hàm thành phần được đặt tên bằng `PascalCase`.
- Bạn có thể kết xuất biểu thức JavaScript trong JSX bằng cách đặt chúng giữa dấu ngoặc nhọn, như `{so}`.
- Một số thuộc tính JSX khác so với thuộc tính HTML để chúng không xung đột với các từ dành riêng JavaScript. Ví dụ, `class` trong HTML được dịch sang `className` trong JSX.
- Props được viết giống như thuộc tính bên trong các lời gọi thành phần và được truyền vào các thành phần.

## Xem thêm

- [Learn React](https://scrimba.com/learn-react-c0e?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Learn React_ của [Scrimba](https://scrimba.com/?via=mdn) là React 101 tối thượng — điểm khởi đầu hoàn hảo cho bất kỳ người mới học React nào. Học những kiến thức cơ bản về React hiện đại bằng cách giải 140+ thử thách lập trình tương tác và xây dựng tám dự án thú vị.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Main_features","Learn_web_development/Core/Frameworks_libraries/React_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}
