---
title: Bắt đầu với Svelte
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Svelte_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết này, chúng ta sẽ có một giới thiệu nhanh về [framework Svelte](https://svelte.dev/). Chúng ta sẽ xem Svelte hoạt động như thế nào và điều gì phân biệt nó với các framework và công cụ khác mà chúng ta đã tìm hiểu. Sau đó, chúng ta sẽ học cách thiết lập môi trường phát triển, tạo ứng dụng mẫu, hiểu cấu trúc dự án, và xem cách chạy ứng dụng trên máy cục bộ và biên dịch nó cho môi trường production.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, bạn nên quen thuộc với các ngôn ngữ cốt lõi
          <a href="/vi/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/vi/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/vi/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          và có kiến thức về
          <a
            href="/vi/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Svelte là một trình biên dịch tạo ra mã JavaScript tối thiểu và được tối ưu hóa cao từ nguồn của chúng ta; bạn sẽ cần một terminal với node + npm được cài đặt để biên dịch và xây dựng ứng dụng.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Thiết lập môi trường phát triển Svelte cục bộ, tạo và xây dựng ứng dụng khởi đầu, và hiểu những kiến thức cơ bản về cách thức hoạt động.
      </td>
    </tr>
  </tbody>
</table>

## Svelte: Một cách tiếp cận mới để xây dựng giao diện người dùng phong phú

Svelte cung cấp một cách tiếp cận khác để xây dựng ứng dụng web so với một số framework khác được đề cập trong mô-đun này. Trong khi các framework như React và Vue thực hiện phần lớn công việc trong trình duyệt của người dùng khi ứng dụng đang chạy, Svelte chuyển công việc đó vào bước biên dịch xảy ra chỉ khi bạn xây dựng ứng dụng, tạo ra mã JavaScript thuần được tối ưu hóa cao.

Kết quả của cách tiếp cận này không chỉ là các gói ứng dụng nhỏ hơn và hiệu suất tốt hơn, mà còn là trải nghiệm nhà phát triển thân thiện hơn với những người có ít kinh nghiệm về hệ sinh thái công cụ hiện đại.

Svelte gắn chặt với mô hình phát triển web cổ điển gồm HTML, CSS và JS, chỉ thêm một vài phần mở rộng cho HTML và JavaScript. Có thể nói nó có ít khái niệm và công cụ cần học hơn so với một số tùy chọn framework khác.

Nhược điểm chính hiện tại của nó là đây là một framework còn trẻ — hệ sinh thái của nó do đó bị hạn chế hơn về công cụ, hỗ trợ, plugin, các mẫu sử dụng rõ ràng, v.v. so với các framework trưởng thành hơn, và cũng có ít cơ hội việc làm hơn. Nhưng những lợi thế của nó đủ để khiến bạn quan tâm khám phá nó.

> [!NOTE]
> Svelte có [hỗ trợ TypeScript chính thức](https://svelte.dev/docs/typescript). Chúng ta sẽ xem xét nó sau trong loạt bài hướng dẫn này.

Chúng tôi khuyến khích bạn xem qua [hướng dẫn Svelte](https://learn.svelte.dev/) để có giới thiệu nhanh về các khái niệm cơ bản, trước khi quay lại loạt bài hướng dẫn này để học cách xây dựng điều gì đó sâu hơn một chút.

## Các trường hợp sử dụng

Svelte có thể được dùng để phát triển các phần nhỏ của giao diện hoặc toàn bộ ứng dụng. Bạn có thể bắt đầu từ đầu để Svelte điều khiển giao diện người dùng hoặc tích hợp dần dần vào ứng dụng hiện có.

Tuy nhiên, Svelte đặc biệt thích hợp để giải quyết các tình huống sau:

- Ứng dụng web dành cho thiết bị có cấu hình thấp: Các ứng dụng được xây dựng bằng Svelte có kích thước gói nhỏ hơn, lý tưởng cho các thiết bị có kết nối mạng chậm và khả năng xử lý hạn chế. Ít mã hơn có nghĩa là ít KB để tải xuống, phân tích cú pháp, thực thi và lưu trong bộ nhớ.
- Các trang có tính tương tác cao hoặc trực quan hóa phức tạp: Nếu bạn đang xây dựng các trực quan hóa dữ liệu cần hiển thị nhiều phần tử DOM, hiệu suất đạt được từ framework không có chi phí thời gian chạy sẽ đảm bảo các tương tác của người dùng nhanh nhạy và phản hồi tốt.
- Giới thiệu người dùng có kiến thức phát triển web cơ bản: Svelte có đường cong học tập nhẹ nhàng. Các nhà phát triển web với kiến thức cơ bản về HTML, CSS và JavaScript có thể dễ dàng nắm bắt các đặc điểm của Svelte trong thời gian ngắn và bắt đầu xây dựng ứng dụng web.

Nhóm Svelte đã ra mắt [SvelteKit](https://kit.svelte.dev/), một framework để xây dựng ứng dụng web sử dụng Svelte. Nó chứa các tính năng được tìm thấy trong các framework web hiện đại, chẳng hạn như định tuyến dựa trên hệ thống tệp, kết xuất phía máy chủ (SSR), chế độ kết xuất dành riêng cho trang, hỗ trợ ngoại tuyến, và nhiều hơn nữa. Để biết thêm thông tin về SvelteKit, hãy xem [hướng dẫn chính thức](https://learn.svelte.dev/) và [tài liệu](https://kit.svelte.dev/docs/introduction).

Svelte cũng có sẵn cho phát triển di động thông qua [Svelte Native](https://svelte.nativescript.org/).

## Svelte hoạt động như thế nào?

Là một trình biên dịch, Svelte có thể mở rộng HTML, CSS và JavaScript, tạo ra mã JavaScript tối ưu mà không có bất kỳ chi phí thời gian chạy nào. Để đạt được điều này, Svelte mở rộng các công nghệ web thuần theo các cách sau:

- Nó mở rộng HTML bằng cách cho phép các biểu thức JavaScript trong phần đánh dấu và cung cấp các chỉ thị để sử dụng điều kiện và vòng lặp, theo kiểu tương tự như handlebars.
- Nó mở rộng CSS bằng cách thêm cơ chế phạm vi, cho phép mỗi thành phần xác định các kiểu dáng riêng mà không có nguy cơ xung đột với kiểu dáng của các thành phần khác.
- Nó mở rộng JavaScript bằng cách tái diễn giải các chỉ thị cụ thể của ngôn ngữ để đạt được khả năng phản ứng thực sự và đơn giản hóa quản lý trạng thái thành phần.

Trình biên dịch chỉ can thiệp trong các tình huống rất cụ thể và chỉ trong bối cảnh các thành phần Svelte. Các phần mở rộng cho ngôn ngữ JavaScript là tối thiểu và được chọn lọc cẩn thận để không phá vỡ cú pháp JavaScript hay làm xa lạ các nhà phát triển. Trên thực tế, bạn sẽ chủ yếu làm việc với JavaScript thuần.

## Các bước đầu tiên với Svelte

Vì Svelte là một trình biên dịch, bạn không thể chỉ thêm thẻ `<script src="svelte.js">` vào trang của bạn và nhập nó vào ứng dụng. Bạn sẽ phải thiết lập môi trường phát triển để cho phép trình biên dịch thực hiện công việc của nó.

### Yêu cầu

Để làm việc với Svelte, bạn cần cài đặt [Node.js](https://nodejs.org/). Khuyến nghị sử dụng phiên bản hỗ trợ dài hạn (LTS). Node bao gồm npm (trình quản lý gói node) và npx (trình chạy gói node). Lưu ý rằng bạn cũng có thể dùng trình quản lý gói Yarn thay cho npm, nhưng chúng tôi sẽ giả định bạn đang dùng npm trong bộ hướng dẫn này. Xem [Kiến thức cơ bản về quản lý gói](/vi/docs/Learn_web_development/Extensions/Client-side_tools/Package_management) để biết thêm thông tin về npm và yarn.

Nếu bạn đang dùng Windows, bạn sẽ cần cài đặt một số phần mềm để có tính tương đương với terminal Unix/macOS nhằm sử dụng các lệnh terminal được đề cập trong hướng dẫn này. Git Bash (đi kèm với [bộ công cụ git for Windows](https://gitforwindows.org/)) hoặc [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/about) đều phù hợp. Xem [Khóa học dòng lệnh ngắn gọn](/vi/docs/Learn_web_development/Getting_started/Environment_setup/Command_line) để biết thêm thông tin về các vấn đề này và về các lệnh terminal nói chung.

Cũng xem phần sau để biết thêm thông tin:

- ["Về npm"](https://docs.npmjs.com/about-npm/) trên tài liệu npm
- ["Giới thiệu npx"](https://blog.npmjs.org/post/162869356040/introducing-npx-an-npm-package-runner) trên blog npm

### Tạo ứng dụng Svelte đầu tiên của bạn

Cách dễ nhất để tạo mẫu ứng dụng khởi đầu là chỉ cần tải xuống ứng dụng mẫu khởi đầu. Bạn có thể làm điều đó bằng cách truy cập [sveltejs/template](https://github.com/sveltejs/template) trên GitHub, hoặc bạn có thể tránh phải tải xuống và giải nén bằng cách chỉ dùng [degit](https://github.com/Rich-Harris/degit).

Để tạo mẫu ứng dụng khởi đầu, chạy các lệnh terminal sau:

```bash
npx degit sveltejs/template moz-todo-svelte
cd moz-todo-svelte
npm install
npm run dev
```

> [!NOTE]
> degit không làm bất kỳ điều gì kỳ diệu — nó chỉ cho phép bạn tải xuống và giải nén phiên bản mới nhất của nội dung một git repo. Điều này nhanh hơn nhiều so với sử dụng `git clone` vì nó sẽ không tải xuống toàn bộ lịch sử của repo, hoặc tạo một bản sao cục bộ hoàn chỉnh.

Sau khi chạy `npm run dev`, Svelte sẽ biên dịch và xây dựng ứng dụng của bạn. Nó sẽ khởi động máy chủ cục bộ tại `localhost:8080`. Svelte sẽ theo dõi các cập nhật tệp và tự động biên dịch lại và làm mới ứng dụng khi thay đổi được thực hiện đối với các tệp nguồn. Trình duyệt của bạn sẽ hiển thị điều gì đó như thế này:

![Một trang khởi đầu đơn giản nói hello world, và cung cấp một liên kết đến các hướng dẫn svelte chính thức](01-svelte-starter-app.png)

### Cấu trúc ứng dụng

Mẫu khởi đầu đi kèm với cấu trúc sau:

```plain
moz-todo-svelte
├── README.md
├── package.json
├── package-lock.json
├── rollup.config.js
├── .gitignore
├── node_modules
├── public
│   ├── favicon.png
│   ├── index.html
│   ├── global.css
│   └── build
│       ├── bundle.css
│       ├── bundle.js
│       └── bundle.js.map
├── scripts
│   └── setupTypeScript.js
└── src
    ├── App.svelte
    └── main.js
```

Nội dung như sau:

- `package.json` và `package-lock.json`: Chứa thông tin về dự án mà Node.js/npm sử dụng để tổ chức nó. Bạn không cần hiểu tệp này để hoàn thành hướng dẫn này, tuy nhiên nếu bạn muốn tìm hiểu thêm, bạn có thể đọc về [xử lý `package.json`](https://docs.npmjs.com/cli/configuring-npm/package-json/) trên npmjs.com; chúng tôi cũng đề cập đến nó trong [hướng dẫn kiến thức cơ bản về quản lý gói](/vi/docs/Learn_web_development/Extensions/Client-side_tools/Package_management).
- `node_modules`: Đây là nơi node lưu các phụ thuộc dự án. Các phụ thuộc này sẽ không được gửi lên môi trường production, chúng chỉ được dùng cho mục đích phát triển.
- `.gitignore`: Cho git biết những tệp hoặc thư mục nào cần bỏ qua từ dự án — hữu ích nếu bạn quyết định bao gồm ứng dụng trong một git repo.
- `rollup.config.js`: Svelte sử dụng [rollup.js](https://rollupjs.org/) làm công cụ đóng gói mô-đun. Tệp cấu hình này cho rollup biết cách biên dịch và xây dựng ứng dụng của bạn. Nếu bạn thích [webpack](https://webpack.js.org/), bạn có thể tạo dự án khởi đầu với `npx degit sveltejs/template-webpack svelte-app`.
- `scripts`: Chứa các script thiết lập theo yêu cầu. Hiện tại chỉ nên chứa `setupTypeScript.js`.
  - `setupTypeScript.js`: Script này thiết lập hỗ trợ TypeScript trong Svelte. Chúng ta sẽ nói thêm về điều này trong bài viết cuối.

- `src`: Thư mục này là nơi mã nguồn của ứng dụng của bạn tồn tại — nơi bạn sẽ tạo mã cho ứng dụng.
  - `App.svelte`: Đây là thành phần cấp cao nhất của ứng dụng của bạn. Hiện tại, nó chỉ hiển thị thông điệp 'Hello World!'.
  - `main.js`: Điểm vào ứng dụng của chúng ta. Nó chỉ khởi tạo thành phần `App` và liên kết nó với phần thân trang HTML của chúng ta.

- `public`: Thư mục này chứa tất cả các tệp sẽ được xuất bản trong môi trường production.
  - `favicon.png`: Đây là favicon của ứng dụng của bạn. Hiện tại, đó là logo Svelte.
  - `index.html`: Đây là trang chính của ứng dụng của bạn. Ban đầu, nó chỉ là một trang HTML trống tải các tệp CSS và các gói js được tạo bởi Svelte.
  - `global.css`: Tệp này chứa các kiểu dáng không có phạm vi. Đó là một tệp CSS thông thường sẽ được áp dụng cho toàn bộ ứng dụng.
  - `build`: Thư mục này chứa mã nguồn CSS và JavaScript được tạo ra.
    - `bundle.css`: Tệp CSS mà Svelte tạo ra từ các kiểu dáng được xác định cho mỗi thành phần.
    - `bundle.js`: Tệp JavaScript được biên dịch từ tất cả mã nguồn JavaScript của bạn.

## Nhìn vào thành phần Svelte đầu tiên của chúng ta

Các thành phần là các khối xây dựng của ứng dụng Svelte. Chúng được viết vào các tệp `.svelte` bằng cách sử dụng một superset của HTML.

Tất cả ba phần — `<script>`, `<style>`, và phần đánh dấu — là tùy chọn và có thể xuất hiện theo bất kỳ thứ tự nào bạn muốn.

```svelte
<script>
  // logic goes here
</script>

<style>
  /* styles go here */
</style>

<!-- markup (zero or more HTML elements) goes here -->
```

> [!NOTE]
> Để biết thêm thông tin về định dạng thành phần, hãy xem [tài liệu Svelte Components](https://svelte.dev/docs/svelte-components).

Với điều này trong đầu, hãy xem tệp `src/App.svelte` đi kèm với mẫu khởi đầu. Bạn sẽ thấy điều gì đó như sau:

```svelte
<script>
  export let name;
</script>

<main>
  <h1>Hello {name}!</h1>
  <p>
    Visit the <a href="https://learn.svelte.dev/">Svelte tutorial</a> to learn
    how to build Svelte apps.
  </p>
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }

  @media (width >= 640px) {
    main {
      max-width: none;
    }
  }
</style>
```

### Phần `<script>`

Khối `<script>` chứa JavaScript chạy khi một phiên bản thành phần được tạo. Các biến được khai báo (hoặc được nhập) ở cấp cao nhất là 'có thể nhìn thấy' từ phần đánh dấu của thành phần. Các biến cấp cao nhất là cách Svelte xử lý trạng thái thành phần, và chúng có khả năng phản ứng theo mặc định. Chúng ta sẽ giải thích chi tiết điều này có nghĩa gì sau.

```svelte
<script>
  export let name;
</script>
```

Svelte sử dụng từ khóa [`export`](/vi/docs/Web/JavaScript/Reference/Statements/export) để đánh dấu khai báo biến như một thuộc tính (hay prop), có nghĩa là nó trở nên có thể truy cập được đối với người tiêu dùng của thành phần (ví dụ: các thành phần khác). Đây là một ví dụ về Svelte mở rộng cú pháp JavaScript để làm cho nó hữu ích hơn, trong khi vẫn giữ cho nó quen thuộc.

### Phần đánh dấu

Trong phần đánh dấu bạn có thể chèn bất kỳ HTML nào bạn muốn, và ngoài ra bạn có thể chèn các biểu thức JavaScript hợp lệ bên trong dấu ngoặc nhọn đơn (`{}`). Trong trường hợp này, chúng ta nhúng giá trị của prop `name` ngay sau văn bản `Hello`.

```svelte
<main>
  <h1>Hello {name}!</h1>
  <p>
    Visit the <a href="https://learn.svelte.dev/">Svelte tutorial</a> to learn
    how to build Svelte apps.
  </p>
</main>
```

Svelte cũng hỗ trợ các thẻ như `{#if}`, `{#each}` và `{#await}` — các ví dụ này cho phép bạn hiển thị có điều kiện một phần của đánh dấu, lặp qua một danh sách các phần tử, và làm việc với các giá trị không đồng bộ, tương ứng.

### Phần `<style>`

Nếu bạn có kinh nghiệm làm việc với CSS, đoạn mã sau sẽ có ý nghĩa:

```svelte
<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }

  @media (width >= 640px) {
    main {
      max-width: none;
    }
  }
</style>
```

Chúng ta đang áp dụng kiểu dáng cho phần tử [`<h1>`](/vi/docs/Web/HTML/Reference/Elements/Heading_Elements) của mình. Điều gì sẽ xảy ra với các thành phần khác có các phần tử `<h1>` trong chúng?

Trong Svelte, CSS bên trong khối `<style>` của một thành phần sẽ chỉ có phạm vi trong thành phần đó. Điều này hoạt động bằng cách thêm một lớp vào các phần tử được chọn, dựa trên một hash của kiểu dáng thành phần.

Bạn có thể thấy điều này trong thực tế bằng cách mở `localhost:8080` trong tab trình duyệt mới, nhấp chuột phải/<kbd>Ctrl</kbd> vào nhãn _HELLO WORLD!_ và chọn _Kiểm tra_:

![Ứng dụng khởi đầu Svelte với devtools mở, hiển thị các lớp cho kiểu dáng có phạm vi](02-svelte-component-scoped-styles.png)

Khi biên dịch ứng dụng, Svelte thay đổi định nghĩa kiểu dáng `h1` của chúng ta thành `h1.svelte-1tky8bj`, và sau đó sửa đổi mọi phần tử `<h1>` trong thành phần của chúng ta thành `<h1 class="svelte-1tky8bj">`, để nó nhận kiểu dáng theo yêu cầu.

> [!NOTE]
> Bạn có thể ghi đè hành vi này và áp dụng kiểu dáng cho một bộ chọn toàn cục bằng cách sử dụng bộ sửa đổi `:global()` (xem [tài liệu Svelte `<style>`](https://svelte.dev/docs/svelte-components#style) để biết thêm thông tin).

## Thực hiện một vài thay đổi

Bây giờ chúng ta đã có ý tưởng chung về cách tất cả khớp với nhau, chúng ta có thể bắt đầu thực hiện một vài thay đổi.
Tại thời điểm này, bạn có thể thử cập nhật thành phần `App.svelte` của mình — ví dụ: thay đổi phần tử `<h1>` trong `App.svelte` để nó đọc như thế này:

```svelte
<h1>Hello {name} from MDN!</h1>
```

Chỉ cần lưu các thay đổi của bạn và ứng dụng đang chạy tại `localhost:8080` sẽ được tự động cập nhật.

### Cái nhìn đầu tiên về khả năng phản ứng của Svelte

Trong bối cảnh một framework UI, khả năng phản ứng có nghĩa là framework có thể tự động cập nhật DOM khi trạng thái của bất kỳ thành phần nào thay đổi.

Trong Svelte, khả năng phản ứng được kích hoạt bằng cách gán một giá trị mới cho bất kỳ biến cấp cao nhất nào trong một thành phần. Ví dụ, chúng ta có thể bao gồm hàm `toggleName()` trong thành phần `App` của chúng ta, và một nút để chạy nó.

Hãy thử cập nhật các phần `<script>` và phần đánh dấu như sau:

```svelte
<script>
  export let name;

  function toggleName() {
    if (name === "world") {
      name = "Svelte";
    } else {
      name = "world";
    }
  }
</script>

<main>
  <h1>Hello {name}!</h1>
  <button on:click="{toggleName}">Toggle name</button>
  <p>
    Visit the <a href="https://learn.svelte.dev/">Svelte tutorial</a> to learn
    how to build Svelte apps.
  </p>
</main>
```

Bất cứ khi nào nút được nhấp, Svelte thực thi hàm `toggleName()`, từ đó cập nhật giá trị của biến `name`.

Như bạn có thể thấy, nhãn `<h1>` được tự động cập nhật. Đằng sau hậu trường, Svelte tạo ra mã JavaScript để cập nhật DOM bất cứ khi nào giá trị của biến name thay đổi, mà không sử dụng bất kỳ DOM ảo hay cơ chế hòa giải phức tạp nào khác.

Lưu ý việc sử dụng `:` trong `on:click`. Đó là cú pháp của Svelte để lắng nghe các sự kiện DOM.

## Kiểm tra main.js: điểm vào của ứng dụng

Hãy mở `src/main.js`, đây là nơi thành phần `App` đang được nhập và sử dụng. Tệp này là điểm vào cho ứng dụng của chúng ta, và ban đầu trông như thế này:

```js
import App from "./App.svelte";

const app = new App({
  target: document.body,
  props: {
    name: "world",
  },
});

export default app;
```

`main.js` bắt đầu bằng cách nhập thành phần Svelte mà chúng ta sắp sử dụng. Sau đó nó được khởi tạo với `new App`, truyền một đối tượng tùy chọn với các thuộc tính sau:

- `target`: Phần tử DOM mà chúng ta muốn thành phần được hiển thị bên trong, trong trường hợp này là phần tử `<body>`.
- `props`: các giá trị để gán cho từng prop của thành phần `App`.

## Một cái nhìn dưới mui xe

Svelte quản lý tất cả các tệp này hoạt động cùng nhau như thế nào?

Trình biên dịch Svelte xử lý phần `<style>` của mỗi thành phần và biên dịch chúng vào tệp `public/build/bundle.css`.

Nó cũng biên dịch phần đánh dấu và phần `<script>` của mỗi thành phần và lưu kết quả trong `public/build/bundle.js`. Nó cũng thêm mã trong `src/main.js` để tham chiếu đến các tính năng của mỗi thành phần.

Cuối cùng, tệp `public/index.html` bao gồm các tệp `bundle.css` và `bundle.js` được tạo ra:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <title>Svelte app</title>

    <link rel="icon" type="image/png" href="/favicon.png" />
    <link rel="stylesheet" href="/global.css" />
    <link rel="stylesheet" href="/build/bundle.css" />

    <script defer src="/build/bundle.js"></script>
  </head>

  <body></body>
</html>
```

Phiên bản thu nhỏ của `bundle.js` nặng hơn một chút so với 3KB, bao gồm "Svelte runtime" (chỉ 300 dòng mã JavaScript) và thành phần `App.svelte` đã biên dịch. Như bạn có thể thấy, `bundle.js` là tệp JavaScript duy nhất được tham chiếu bởi `index.html`. Không có thư viện nào khác được tải vào trang web.

Đây là dấu chân nhỏ hơn nhiều so với các gói đã biên dịch từ các framework khác. Hãy tính đến việc, trong trường hợp các gói mã, không chỉ là kích thước của các tệp bạn phải tải xuống mới quan trọng. Đây là mã có thể thực thi cần được phân tích cú pháp, thực thi và lưu trong bộ nhớ. Vì vậy điều này thực sự tạo ra sự khác biệt, đặc biệt là trên các thiết bị có cấu hình thấp hoặc các ứng dụng tốn nhiều CPU.

## Theo dõi hướng dẫn này

Trong loạt bài hướng dẫn này, bạn sẽ xây dựng một ứng dụng web hoàn chỉnh. Chúng ta sẽ học tất cả những kiến thức cơ bản về Svelte và cũng khá nhiều chủ đề nâng cao.

Bạn chỉ có thể đọc nội dung để hiểu tốt về các tính năng Svelte, nhưng bạn sẽ thu được nhiều nhất từ hướng dẫn này nếu bạn theo dõi và lập trình ứng dụng cùng chúng tôi khi bạn đi. Để giúp bạn dễ dàng theo dõi từng bài viết, chúng tôi cung cấp một kho lưu trữ GitHub với thư mục chứa nguồn cho ứng dụng như lúc bắt đầu mỗi hướng dẫn.

Svelte cũng cung cấp một REPL trực tuyến, đây là sân chơi để lập trình trực tiếp các ứng dụng Svelte trên web mà không cần cài đặt bất cứ thứ gì trên máy của bạn. Chúng tôi cung cấp một REPL cho mỗi bài viết để bạn có thể bắt đầu lập trình ngay lập tức. Hãy nói thêm một chút về cách sử dụng các công cụ này.

### Sử dụng Git

Hệ thống kiểm soát phiên bản phổ biến nhất là Git, cùng với GitHub, một trang cung cấp dịch vụ lưu trữ cho các kho lưu trữ của bạn và một số công cụ để làm việc với chúng.

Chúng ta sẽ sử dụng GitHub để bạn có thể dễ dàng tải xuống mã nguồn cho mỗi bài viết. Bạn cũng sẽ có thể lấy mã như kết quả sau khi hoàn thành bài viết, trong trường hợp bạn bị lạc.

Sau khi [cài đặt git](https://git-scm.com/downloads/), để sao chép kho lưu trữ bạn nên thực thi:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó, ở đầu mỗi bài viết, bạn chỉ cần `cd` vào thư mục tương ứng và khởi động ứng dụng ở chế độ dev để xem trạng thái hiện tại của nó, như thế này:

```bash
cd 02-starting-our-todo-app
npm install
npm run dev
```

Nếu bạn muốn tìm hiểu thêm về git và GitHub, chúng tôi đã biên soạn một danh sách các liên kết đến các hướng dẫn hữu ích — xem [Git và GitHub](/vi/docs/Learn_web_development/Core/Version_control).

> [!NOTE]
> Nếu bạn chỉ muốn tải xuống các tệp mà không sao chép git repo, bạn có thể sử dụng công cụ degit như thế này — `npx degit opensas/mdn-svelte-tutorial`. Bạn cũng có thể tải xuống một thư mục cụ thể với `npx degit opensas/mdn-svelte-tutorial/01-getting-started`. Degit sẽ không tạo git repo cục bộ, nó chỉ tải xuống các tệp của thư mục được chỉ định.

### Sử dụng Svelte REPL

Một REPL ([read–eval–print loop](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)) là một môi trường tương tác cho phép bạn nhập lệnh và xem kết quả ngay lập tức — nhiều ngôn ngữ lập trình cung cấp REPL.

REPL của Svelte còn hơn thế. Đây là một công cụ trực tuyến cho phép bạn tạo các ứng dụng hoàn chỉnh, lưu chúng trực tuyến và chia sẻ với người khác.

Đây là cách dễ nhất để bắt đầu chơi với Svelte từ bất kỳ máy nào, mà không cần cài đặt bất cứ thứ gì. Nó cũng được sử dụng rộng rãi bởi cộng đồng Svelte. Nếu bạn muốn chia sẻ một ý tưởng, nhờ giúp đỡ, hoặc báo cáo một vấn đề, luôn luôn cực kỳ hữu ích khi tạo một phiên bản REPL thể hiện vấn đề.

Hãy có một cái nhìn nhanh về Svelte REPL và cách bạn sẽ sử dụng nó. Nó trông như thế này:

![svelte REPL đang hoạt động, hiển thị mã thành phần ở bên trái và đầu ra ở bên phải](03-svelte-repl-in-action.png)

Để bắt đầu REPL, mở trình duyệt của bạn và điều hướng đến <https://svelte.dev/repl>.

- Ở phía bên trái màn hình, bạn sẽ thấy mã của các thành phần, và ở bên phải bạn sẽ thấy đầu ra đang chạy của ứng dụng của bạn.
- Thanh trên mã cho phép bạn tạo các tệp `.svelte` và `.js` và sắp xếp lại chúng. Để tạo một tệp bên trong thư mục, chỉ cần chỉ định đường dẫn đầy đủ, như thế này: `components/MyComponent.svelte`. Thư mục sẽ được tạo tự động.
- Phía trên thanh đó, bạn có tiêu đề của REPL. Nhấp vào nó để chỉnh sửa.
- Ở bên phải bạn có ba tab:
  - Tab _Result_ hiển thị đầu ra của ứng dụng của bạn và cung cấp bảng điều khiển ở phía dưới.
  - Tab _JS output_ cho phép bạn kiểm tra mã JavaScript được tạo ra bởi Svelte và thiết lập các tùy chọn trình biên dịch.
  - Tab _CSS output_ hiển thị CSS được tạo ra bởi Svelte.

- Phía trên các tab, bạn sẽ thấy thanh công cụ cho phép bạn vào chế độ toàn màn hình và tải xuống ứng dụng của bạn. Nếu bạn đăng nhập bằng tài khoản GitHub, bạn cũng sẽ có thể phân nhánh và lưu ứng dụng. Bạn cũng sẽ có thể xem tất cả các REPL đã lưu của bạn bằng cách nhấp vào hồ sơ tên người dùng GitHub của bạn và chọn _Your saved apps_.

Bất cứ khi nào bạn thay đổi bất kỳ tệp nào trên REPL, Svelte sẽ biên dịch lại ứng dụng và cập nhật tab Result. Để chia sẻ ứng dụng của bạn, hãy chia sẻ URL. Ví dụ, đây là liên kết đến REPL chạy ứng dụng hoàn chỉnh của chúng ta: <https://svelte.dev/repl/378dd79e0dfe4486a8f10823f3813190?version=3.23.2>.

> [!NOTE]
> Chú ý cách bạn có thể chỉ định phiên bản Svelte trong URL. Điều này hữu ích khi báo cáo các vấn đề liên quan đến một phiên bản Svelte cụ thể.

Chúng tôi sẽ cung cấp một REPL ở đầu và cuối mỗi bài viết để bạn có thể bắt đầu lập trình cùng chúng tôi ngay lập tức.

> [!NOTE]
> Hiện tại REPL không thể xử lý tên thư mục đúng cách. Nếu bạn đang theo dõi hướng dẫn trên REPL, hãy tạo tất cả các thành phần của bạn bên trong thư mục gốc. Sau đó khi bạn thấy đường dẫn trong mã, ví dụ: `import Todos from './components/Todos.svelte'`, chỉ cần thay thế nó bằng URL phẳng, ví dụ: `import Todos from './Todos.svelte'`.

## Mã cho đến nay

### Git

Sao chép kho lưu trữ GitHub (nếu bạn chưa làm điều đó) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/01-getting-started
```

Hoặc tải xuống trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/01-getting-started
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

### REPL

Để lập trình cùng chúng tôi bằng REPL, bắt đầu tại

<https://svelte.dev/repl/fc68b4f059d34b9c84fa042d1cce586c?version=3.23.2>

## Tóm tắt

Điều này đưa chúng ta đến cuối cái nhìn ban đầu về Svelte, bao gồm cách cài đặt nó cục bộ, tạo ứng dụng khởi đầu, và cách những kiến thức cơ bản hoạt động. Trong bài viết tiếp theo chúng ta sẽ bắt đầu xây dựng ứng dụng thực sự đầu tiên của mình, một danh sách việc cần làm. Tuy nhiên, trước khi làm điều đó, hãy tóm tắt một số điều chúng ta đã học.

Trong Svelte:

- Chúng ta xác định script, kiểu dáng và đánh dấu của mỗi thành phần trong một tệp `.svelte` duy nhất.
- Các prop thành phần được khai báo bằng từ khóa `export`.
- Các thành phần Svelte có thể được sử dụng chỉ bằng cách nhập tệp `.svelte` tương ứng.
- Các kiểu dáng thành phần có phạm vi, giữ chúng không xung đột với nhau.
- Trong phần đánh dấu, bạn có thể bao gồm bất kỳ biểu thức JavaScript nào bằng cách đặt nó giữa các dấu ngoặc nhọn.
- Các biến cấp cao nhất của một thành phần tạo thành trạng thái của nó.
- Khả năng phản ứng được kích hoạt chỉ bằng cách gán một giá trị mới cho một biến cấp cao nhất.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Svelte_todo_list_beginning", "Learn_web_development/Core/Frameworks_libraries")}}
