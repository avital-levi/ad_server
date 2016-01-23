import random


def weighted_choice(choices):
    """Like random.choice, but each element can have a different chance of
    being selected.

    choices can be any iterable containing iterables with two items each.
    The first item is the thing being chosen, the second item is
    its weight.  The weights can be any numeric values, what matters is the
    relative differences between them.
    """
    total = float(sum(w for c, w in choices))
    r = random.uniform(0, total)
    upto = 0.0
    for c, w in choices:
        if upto + float(w) >= r:
            return c
        upto += float(w)
    raise ValueError("Shouldn't get here")