open Emotion

let light = (~disabled) => css({
    "height": "100px",
    "width": "100px",
    "padding": "25px",
    "borderRadius": "50%",
    "backgroundColor": switch disabled {
            | 0 => "red"
            | 1 => "black"
            | 2 => "white"
        }
})

let main = rawCss(`
    width: 100%;
    height: calc(100vh - 50px);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
`)

let send = rawCss(`
    margin: 15px;
`)