import torch
from torch import Tensor


def add(x: Tensor, y: Tensor) -> Tensor:
    return x + y

def main():
    device = "cuda" if torch.cuda.is_avaliable() else "cpu";
    actual = add(Tensor([[1, 2, 3]].to(device), Tensor([[4, 5, 6]])).to(device))
    expected = Tensor([[5, 7, 9]]).to(device)
    assert actual == expected

if __name__ == "__main__":
    main()
