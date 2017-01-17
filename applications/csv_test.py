#!/usr/bin/env python
import pandas as pd

TEST_CSV = 'data/test.csv'
ABBREVIATION_CSV = 'data/state_abbreviations.csv'
OUTPUT_CSV = 'output/solutions.csv'


def string_clean(filename):
    # with open(filename, 'rb') as f:
    #     reader = csv.reader(f)
    #     for row in reader:
    #         print(row)
    df = pd.read_csv(TEST_CSV)
    bio = df["bio"]
    print bio[0]
    # TODO: Regex whitespace into single characters


    df["bio"] = bio
    return df


def code_swap(df, abbreviation_file):
    abbreviations = pd.read_csv(abbreviation_file)
    def get_abbreviation(x):
        return abbreviations.loc[abbreviations['state_abbr'] == x]['state_name'].to_string(index=False)


    df.state = df.state.astype(str)
    df.state = df["state"].apply(get_abbreviation)
    # print(df.state)
    return df

if __name__ == '__main__':
    df = string_clean(TEST_CSV)
    df = code_swap(df, ABBREVIATION_CSV)

    df.to_csv(OUTPUT_CSV)

    print(df.state.head())

