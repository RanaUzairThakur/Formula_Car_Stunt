using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ModeSelection : MonoBehaviour
{
    public GameObject[] ModeBtns;

    public GameObject[] Highlights;
    // Start is called before the first frame update
    void Start()
    {
        Highlights = new GameObject[ModeBtns.Length];
        for (int i = 0; i < Highlights.Length; i++)
        {
            Highlights[i] = ModeBtns[i].transform.GetChild(1).gameObject;
        }
        RefreshModeSelection();
    }

    public void SelectMode(int mode)
    {
        PlayerPrefs.SetInt("CurrentMode", mode);
        RefreshModeSelection();
        //RefreshLevelSelection();
    }

    void RefreshModeSelection()
    {
        for (int i = 0; i < Highlights.Length; i++)
        {
            if ((i) == PlayerPrefs.GetInt("CurrentMode", 0))
                Highlights[i].SetActive(true);
            else
                Highlights[i].SetActive(false);
        }
    }
}
